// services/user.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, map } from 'rxjs';
import { environment } from '../../../src/environments/environment';

export interface User {
  id: number;
  firstName: string;
  lastName: string;
  emailAddress: string;
  roleName: string;
  phoneNumber?: string;
  password?: string;
  createdDate?: Date;
  modifiedDate?: Date;
}
export interface CreateUserDto {
  firstName: string;
  lastName: string;
  phoneNumber: string;
  emailAddress: string;
  password: string;
  roleId: number;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiUrl = `${environment.apiUrl}/User`;

  constructor(private http: HttpClient) {}

  getAllUsers(): Observable<User[]> {
    console.log('Fetching users from:', this.apiUrl);
    return this.http.get<User[]>(this.apiUrl);
  }

  getUserById(id: number): Observable<User> {
    return this.http.get<User>(`${this.apiUrl}/${id}`);
  }

  createUser(user: CreateUserDto): Observable<any> {
    return this.http.post<any>(this.apiUrl, user);
  }

  updateUser(id: number, user: CreateUserDto): Observable<any> {
    return this.http.put<any>(`${this.apiUrl}/${id}`, user);
  }


  deleteUser(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

// services/mission.service.ts
export interface Mission {
  id: number;
  title: string;
  description: string;
  startDate: Date;
  endDate: Date;
  status: string;
  themeId: number;
  skillIds: number[];
}

export interface MissionDto {
  missionTitle: string;
  missionDescription: string;
  missionOrganisationName: string;
  missionOrganisationDetail: string;
  countryId: number;
  cityId: number;
  missionThemeId: number;
  missionType: string;
  totalSeats: number;
  missionSkillId: string; // comma-separated e.g. "1,2,3"
  missionImages: string;
  missionDocuments: string;
  missionAvailability: string;
  missionVideoUrl: string;
  isActive: boolean;
}


export interface MissionReadDto {
  id: number;
  missionTitle: string;
  missionDescription: string;
  missionOrganisationName: string;
  missionOrganisationDetail: string;
  countryId: number;
  countryName: string;
  cityId: number;
  cityName: string;
  missionThemeId: number;
  missionThemeTitle: string;
  missionType: string;
  totalSeats: number;
  missionSkillId: string;  // or `number[]` if your backend returns an array
  missionImages: string;
  missionDocuments: string;
  missionAvailability: string;
  missionVideoUrl: string;
  isActive: boolean;
}


@Injectable({
  providedIn: 'root'
})
export class MissionService {
  private apiUrl =  `${environment.apiUrl}/Mission`;
  constructor(private http: HttpClient) {}

  getAllMissions(): Observable<MissionReadDto[]> {
    return this.http.get<MissionReadDto[]>(this.apiUrl);
  }

  getMissionById(id: number): Observable<MissionReadDto> {
    return this.http.get<MissionReadDto>(`${this.apiUrl}/${id}`);
  }

  createMission(mission: MissionDto): Observable<Mission> {
    return this.http.post<Mission>(this.apiUrl, mission);
  }

  updateMission(id: number, mission: MissionDto): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, mission);
  }

  deleteMission(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

// services/mission-theme.service.ts
export interface MissionTheme {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class MissionThemeService {
  private apiUrl = `${environment.apiUrl}/MissionTheme`;

  constructor(private http: HttpClient) {}

  getAllThemes(): Observable<MissionTheme[]> {
    return this.http.get<MissionTheme[]>(this.apiUrl);
  }

  getThemeById(id: number): Observable<MissionTheme> {
    return this.http.get<MissionTheme>(`${this.apiUrl}/${id}`);
  }

  createTheme(theme: MissionTheme): Observable<MissionTheme> {
    return this.http.post<MissionTheme>(this.apiUrl, theme);
  }

  updateTheme(id: number, theme: MissionTheme): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, theme);
  }

  deleteTheme(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}

// services/mission-skill.service.ts
export interface MissionSkill {
  id: number;
  name: string;
}

@Injectable({
  providedIn: 'root'
})
export class MissionSkillService {
  private apiUrl = `${environment.apiUrl}/MissionSkill`;

  constructor(private http: HttpClient) {}

  getAllSkills(): Observable<MissionSkill[]> {
    return this.http.get<MissionSkill[]>(this.apiUrl);
  }

  getSkillById(id: number): Observable<MissionSkill> {
    return this.http.get<MissionSkill>(`${this.apiUrl}/${id}`);
  }

  createSkill(skill: MissionSkill): Observable<MissionSkill> {
    return this.http.post<MissionSkill>(this.apiUrl, skill);
  }

  updateSkill(id: number, skill: MissionSkill): Observable<void> {
    return this.http.put<void>(`${this.apiUrl}/${id}`, skill);
  }

  deleteSkill(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}


@Injectable({
  providedIn: 'root'
})
export class LocationService {
  private apiUrl = `${environment.apiUrl}/Location`;

  constructor(private http: HttpClient) {}

  getCountries(): Observable<{ id: number; name: string }[]> {
    return this.http.get<{ id: number; name: string }[]>(`${this.apiUrl}/countries`);
  }

  getCitiesByCountry(countryId: number): Observable<{ id: number; name: string }[]> {
    return this.http.get<{ id: number; name: string }[]>(`${this.apiUrl}/cities/${countryId}`);
  }
}



@Injectable({
  providedIn: 'root'
})
export class UploadService {
  private baseUrl =  `${environment.apiUrl}/Upload`;

  constructor(private http: HttpClient) {}

  uploadImage(file: File): Observable<string> {
    const formData = new FormData();
    formData.append('file', file);

    return this.http.post<{ fileName: string }>(`${this.baseUrl}/image`, formData)
      .pipe(map(response => response.fileName));
  }

  uploadDocument(file: File): Observable<string> {
    const formData = new FormData();
    formData.append('file', file);

    return this.http.post<{ fileName: string }>(`${this.baseUrl}/document`, formData)
      .pipe(map(response => response.fileName));
  }
}

export interface MissionApplication {
  id: number;
  userId: number;
  missionId: number;
  motivationNote: string;
  appliedDate: string;
  status: string;
}


@Injectable({
  providedIn: 'root',
})
export class MissionApplicationService {
  private baseUrl = `${environment.apiUrl}/MissionApplication`;

  constructor(private http: HttpClient) {}

  // Apply for a mission
  applyOrUpdateApplication(userId: number, data: any): Observable<boolean> {
    return this.http.post<boolean>(`${this.baseUrl}?userId=${userId}`, data);
  }

  getApplicationsByUser(userId: number): Observable<MissionApplication[]> {
    return this.http.get<MissionApplication[]>(`${this.baseUrl}/user/${userId}`);
  }

  getPendingApplications(): Observable<MissionApplication[]> {
    return this.http.get<MissionApplication[]>(`${this.baseUrl}/pending`);
  }

  updateApplicationStatus(id: number, status: 'approved' | 'rejected'): Observable<any> {
    return this.http.put(`${this.baseUrl}/${status}/${id}`, {});
  }

  getApplicationsByMission(missionId: number): Observable<MissionApplication[]> {
    return this.http.get<MissionApplication[]>(`${this.baseUrl}/mission/${missionId}`);
  }

  cancelApplication(applicationId: number, userId: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/cancel/${applicationId}?userId=${userId}`);
  }
}



export interface UserProfile {
  id?: number;
  userId?: number;
  bio: string;
  profileImageUrl: string;
}

@Injectable({
  providedIn: 'root',
})
export class UserProfileService {
  private baseUrl = `${environment.apiUrl}/userprofile`;

  constructor(private http: HttpClient) {}

  // GET: Fetch current user's profile
  getProfile(): Observable<UserProfile> {
    return this.http.get<UserProfile>(`${this.baseUrl}/profile`);
  }

  // PUT: Update current user's profile
  updateProfile(profile: UserProfile): Observable<any> {
    return this.http.put(`${this.baseUrl}/profile`, profile);
  }
}


