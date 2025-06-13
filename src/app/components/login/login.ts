import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators, ReactiveFormsModule } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule, RouterModule],
  templateUrl: './login.html',
  styleUrls: ['./login.css']
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;
  isLoading = false;
  errorMessage = '';
  showPassword = false;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router
  ) {
    this.loginForm = this.fb.group({
      emailAddress: ['', [Validators.required, Validators.email]], // Changed from username to emailAddress
      password: ['', [Validators.required]]
    });
  }

  ngOnInit(): void {
    // Redirect if already authenticated
    if (this.authService.isAuthenticated()) {
      this.redirectToDashboard();
    }
  }

  togglePasswordVisibility(): void {
    this.showPassword = !this.showPassword;
  }

  onSubmit(): void {
    if (this.loginForm.valid) {
      this.isLoading = true;
      this.errorMessage = '';

      // Updated to match backend LoginDto structure
      const loginRequest = {
        emailAddress: this.loginForm.value.emailAddress.trim(),
        password: this.loginForm.value.password
      };

      this.authService.login(loginRequest).subscribe({
        next: (response) => {
          this.isLoading = false;
          console.log('Login successful:', response);
          
          // Store user info matching your backend response structure
          localStorage.setItem('currentUser', JSON.stringify({
            id: response.id,
            emailAddress: response.emailAddress,
            firstName: response.firstName,
            lastName: response.lastName,
            role: response.role
          }));

          // Redirect based on role
          this.redirectToDashboard(response.role);
        },
        error: (error) => {
          this.isLoading = false;
          console.error('Login error:', error);
          
          if (error.status === 401) {
            this.errorMessage = 'Invalid email or password. Please try again.';
          } else if (error.status === 400) {
            this.errorMessage = 'Please check your login credentials.';
          } else if (error.status === 0) {
            this.errorMessage = 'Unable to connect to server. Please try again later.';
          } else {
            this.errorMessage = error.error?.message || 'Login failed. Please try again later.';
          }
        }
      });
    } else {
      this.markFormGroupTouched();
    }
  }

  private redirectToDashboard(role?: string): void {
    const userRole = role || this.authService.getCurrentUser()?.role;
    
    switch (userRole?.toLowerCase()) {
      case 'admin':
        this.router.navigate(['/admin-dashboard']);
        break;
      case 'editor':
        this.router.navigate(['/editor-dashboard']);
        break;
      case 'user':
        this.router.navigate(['/user-dashboard']);
        break;
      default:
        // Default dashboard if role is not recognized
        this.router.navigate(['/dashboard']);
        break;
    }
  }

  private markFormGroupTouched(): void {
    Object.keys(this.loginForm.controls).forEach(key => {
      const control = this.loginForm.get(key);
      control?.markAsTouched();
    });
  }

  getFieldError(fieldName: string): string {
    const field = this.loginForm.get(fieldName);
    if (field?.touched && field?.errors) {
      if (field.errors['required']) {
        return `${this.getFieldDisplayName(fieldName)} is required`;
      }
      if (field.errors['email']) {
        return 'Please enter a valid email address';
      }
    }
    return '';
  }

  private getFieldDisplayName(fieldName: string): string {
    const displayNames: {[key: string]: string} = {
      emailAddress: 'Email Address', // Updated from username
      password: 'Password'
    };
    return displayNames[fieldName] || fieldName;
  }

  hasFieldError(fieldName: string): boolean {
    return this.getFieldError(fieldName) !== '';
  }
}