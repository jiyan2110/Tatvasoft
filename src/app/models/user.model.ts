export interface User {
   id: number;
  firstName: string;
  lastName: string;
  emailAddress: string;
  roleName: string;
  phoneNumber?: string;
  createdDate?: Date;
  modifiedDate?: Date;
}

export interface LoginRequest {
  username: string;
  password: string;
}

export interface LoginResponse {
  token: string;
  username: string;
  role: string;
  email: string;
  id: number;
}

export interface RegisterRequest {
  username: string;
  email: string;
  password: string;
  roleId: number;
}

export interface Role {
  id: number;
  name: string;
}