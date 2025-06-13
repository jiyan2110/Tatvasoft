import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule, AbstractControl } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';

interface Role {
  id: number;
  name: string;
}

interface RegisterRequest {
  firstName: string;
  lastName: string;
  phoneNumber: string;
  emailAddress: string;
  password: string;
  roleId: number;
}

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterModule],
  templateUrl: './register.html',
  styleUrls: ['./register.css']
})
export class RegisterComponent implements OnInit {
  registerForm: FormGroup;
  roles: Role[] = [];
  isLoading = false;
  errorMessage = '';
  successMessage = '';
  showPassword = false;
  showConfirmPassword = false;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.registerForm = this.fb.group({
      firstName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(50)]],
      lastName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(50)]],
      phoneNumber: ['', [Validators.required, Validators.pattern(/^[\+]?[1-9][\d]{0,15}$/)]],
      emailAddress: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6), this.passwordValidator]],
      confirmPassword: ['', [Validators.required]],
      roleId: ['', [Validators.required]]
    }, { validators: this.passwordMatchValidator });
  }

  ngOnInit(): void {
    this.loadRoles();
  }

  loadRoles(): void {
    this.authService.getRoles().subscribe({
      next: (roles) => {
        this.roles = roles;
      },
      error: (error) => {
        console.error('Error loading roles:', error);
        this.errorMessage = 'Failed to load roles. Please refresh the page.';
      }
    });
  }

  passwordValidator(control: AbstractControl): {[key: string]: any} | null {
    const value = control.value;
    if (!value) return null;
    
    const hasNumber = /[0-9]/.test(value);
    const hasUpper = /[A-Z]/.test(value);
    const hasLower = /[a-z]/.test(value);
    const hasSpecial = /[!@#$%^&*(),.?":{}|<>]/.test(value);
    
    const valid = hasNumber && hasUpper && hasLower && hasSpecial;
    
    if (!valid) {
      return { 
        passwordStrength: {
          hasNumber,
          hasUpper,
          hasLower,
          hasSpecial
        }
      };
    }
    
    return null;
  }

  passwordMatchValidator(form: AbstractControl): {[key: string]: any} | null {
    const password = form.get('password');
    const confirmPassword = form.get('confirmPassword');
    
    if (password && confirmPassword && password.value !== confirmPassword.value) {
      return { passwordMismatch: true };
    }
    
    return null;
  }

  getPasswordStrength(): string {
    const password = this.registerForm.get('password')?.value || '';
    
    if (password.length === 0) return '';
    
    let strength = 0;
    if (password.length >= 6) strength++;
    if (/[A-Z]/.test(password)) strength++;
    if (/[a-z]/.test(password)) strength++;
    if (/[0-9]/.test(password)) strength++;
    if (/[!@#$%^&*(),.?":{}|<>]/.test(password)) strength++;
    
    if (strength <= 2) return 'weak';
    if (strength <= 3) return 'medium';
    return 'strong';
  }

  getPasswordStrengthColor(): string {
    const strength = this.getPasswordStrength();
    switch (strength) {
      case 'weak': return '#ff4444';
      case 'medium': return '#ffaa00';
      case 'strong': return '#00aa44';
      default: return '#ddd';
    }
  }

  togglePasswordVisibility(field: 'password' | 'confirmPassword'): void {
    if (field === 'password') {
      this.showPassword = !this.showPassword;
    } else {
      this.showConfirmPassword = !this.showConfirmPassword;
    }
  }

  onSubmit(): void {
    if (this.registerForm.valid) {
      this.isLoading = true;
      this.errorMessage = '';
      this.successMessage = '';

      const formValue = this.registerForm.value;
      const registerRequest: RegisterRequest = {
        firstName: formValue.firstName,
        lastName: formValue.lastName,
        phoneNumber: formValue.phoneNumber,
        emailAddress: formValue.emailAddress,
        password: formValue.password,
        roleId: parseInt(formValue.roleId)
      };

      this.authService.register(registerRequest).subscribe({
        next: (response) => {
          this.isLoading = false;
          this.successMessage = 'Registration successful! Redirecting to login...';
          
          setTimeout(() => {
            this.router.navigate(['/login']);
          }, 2000);
        },
        error: (error) => {
          this.isLoading = false;
          console.error('Registration error:', error);
          
          if (error.error && typeof error.error === 'string') {
            this.errorMessage = error.error;
          } else if (error.status === 400) {
            this.errorMessage = 'Invalid registration data. Please check your input.';
          } else {
            this.errorMessage = 'Registration failed. Please try again later.';
          }
        }
      });
    } else {
      this.markFormGroupTouched();
    }
  }

  private markFormGroupTouched(): void {
    Object.keys(this.registerForm.controls).forEach(key => {
      const control = this.registerForm.get(key);
      control?.markAsTouched();
    });
  }

  getFieldError(fieldName: string): string {
    const field = this.registerForm.get(fieldName);
    if (field?.touched && field?.errors) {
      if (field.errors['required']) return `${this.getFieldDisplayName(fieldName)} is required`;
      if (field.errors['email']) return 'Please enter a valid email address';
      if (field.errors['pattern'] && fieldName === 'phoneNumber') return 'Please enter a valid phone number';
      if (field.errors['minlength']) return `${this.getFieldDisplayName(fieldName)} must be at least ${field.errors['minlength'].requiredLength} characters`;
      if (field.errors['maxlength']) return `${this.getFieldDisplayName(fieldName)} must not exceed ${field.errors['maxlength'].requiredLength} characters`;
      if (field.errors['passwordStrength']) return 'Password must contain uppercase, lowercase, number, and special character';
    }
    
    if (fieldName === 'confirmPassword' && this.registerForm.errors?.['passwordMismatch'] && field?.touched) {
      return 'Passwords do not match';
    }
    
    return '';
  }

  private getFieldDisplayName(fieldName: string): string {
    const displayNames: {[key: string]: string} = {
      firstName: 'First Name',
      lastName: 'Last Name',
      phoneNumber: 'Phone Number',
      emailAddress: 'Email Address',
      password: 'Password',
      confirmPassword: 'Confirm Password',
      roleId: 'Role'
    };
    return displayNames[fieldName] || fieldName;
  }

  hasFieldError(fieldName: string): boolean {
    return this.getFieldError(fieldName) !== '';
  }
}