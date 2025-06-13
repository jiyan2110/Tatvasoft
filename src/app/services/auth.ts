import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { tap } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { environment } from '../../environments/environment';

@Injectable({ providedIn: 'root' })
export class AuthService {
  private api = environment.apiUrl + '/auth';

  constructor(private http: HttpClient, private router: Router) {}

  // Updated to match your backend LoginDto structure
  login(credentials: { emailAddress: string, password: string }): Observable<any> {
    return this.http.post<any>(`${this.api}/login`, credentials)
      .pipe(
        tap(res => {
          if (res.token) {
            localStorage.setItem('jwtToken', res.token);
            // Store user info matching your backend response structure
            localStorage.setItem('currentUser', JSON.stringify({
              id: res.id,
              emailAddress: res.emailAddress,
              firstName: res.firstName,
              lastName: res.lastName,
              role: res.role
            }));
          }
        })
      );
  }

  // Updated to match your backend RegisterDto structure
  register(user: {
    firstName: string,
    lastName: string,
    phoneNumber: string,
    emailAddress: string,
    password: string,
    roleId: number
  }): Observable<any> {
    return this.http.post(`${this.api}/register`, user);
  }

  // Get available roles for registration
  getRoles(): Observable<any> {
    return this.http.get(`${this.api}/roles`);
  }

  logout() {
    localStorage.removeItem('jwtToken');
    localStorage.removeItem('currentUser');
    this.router.navigate(['/login']);
  }

  getToken(): string | null {
    return localStorage.getItem('jwtToken');
  }

  getCurrentUser(): any {
    const userStr = localStorage.getItem('currentUser');
    return userStr ? JSON.parse(userStr) : null;
  }

  getRoleFromToken(): string | null {
    const user = this.getCurrentUser();
    return user ? user.role : null;
  }

  isAuthenticated(): boolean {
    const token = this.getToken();
    if (!token) return false;
    
    // Check if token is expired
    try {
      const payload = JSON.parse(atob(token.split('.')[1]));
      const currentTime = Date.now() / 1000;
      return payload.exp > currentTime;
    } catch {
      return false;
    }
  }
}