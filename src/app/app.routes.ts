import { Routes } from '@angular/router';
import { BookListComponent } from './components/book-list/book-list';
import { LoginComponent } from './components/login/login';
import { RegisterComponent } from './components/register/register';
import { ForgotPasswordComponent } from './components/forgot-password/forgot-password';
import { DashboardComponent } from './components/dashboard/dashboard';
import { AdminViewComponent } from './components/dashboard/admin-view/admin-view';
import { AuthGuard } from './guards/auth.guard';
import { RoleGuard } from './guards/role.guard';
import { UserViewComponent } from './components/dashboard/user-view/user-view';

export const routes: Routes = [
  { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'forgot-password', component: ForgotPasswordComponent },
  { path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard] },
  { path: 'admin-dashboard', component: AdminViewComponent, canActivate: [AuthGuard, RoleGuard], data: { role: 'Admin' } },
  { path: 'user-dashboard', component: UserViewComponent, canActivate: [AuthGuard, RoleGuard], data: { role: 'User' } },
];
