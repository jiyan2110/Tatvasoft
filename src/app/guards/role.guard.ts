import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, Router } from '@angular/router';
import { AuthService } from '../services/auth';  // adjust path if needed

@Injectable({ providedIn: 'root' })
export class RoleGuard implements CanActivate {
  constructor(private auth: AuthService, private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot): boolean {
    const expectedRole = route.data['role'];
    const role = this.auth.getRoleFromToken();

    if (role !== expectedRole) {
      this.router.navigate(['/dashboard']);
      return false;
    }
    return true;
  }
}
