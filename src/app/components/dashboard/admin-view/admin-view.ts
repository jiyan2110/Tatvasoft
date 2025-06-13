import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../../services/auth';
import { UserService, User } from '../../../services/user';
import { MissionService, MissionReadDto, MissionDto } from '../../../services/user';
import { MissionThemeService, MissionTheme, UploadService } from '../../../services/user';
import { MissionSkillService, MissionSkill, LocationService, MissionApplication, MissionApplicationService } from '../../../services/user';

@Component({
  selector: 'app-admin',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './admin-view.html',
  styleUrls: ['./admin-view.css']
})
export class AdminViewComponent implements OnInit {
  currentUser: any;
  activeMenuItem: string = 'users';
  sidebarCollapsed: boolean = false;

  // Data arrays
  users: User[] = [];
  missions: MissionReadDto[] = [];
  missionThemes: MissionTheme[] = [];
  missionSkills: MissionSkill[] = [];
  countries: { id: number; name: string }[] = [];
  cities: { id: number; name: string }[] = [];
  allApplications: MissionApplication[] = [];
  applicationsLoading: boolean = false;

  // Loading states
  usersLoading: boolean = false;
  missionsLoading: boolean = false;
  themesLoading: boolean = false;
  skillsLoading: boolean = false;

  // Form states
  showUserForm: boolean = false;
  showMissionForm: boolean = false;
  showThemeForm: boolean = false;
  showSkillForm: boolean = false;

  // Form data
  userForm = {
  firstName: '',
  lastName: '',
  phoneNumber: '',
  emailAddress: '',
  password: '',
  roleId: 0
  };
  roles = [{ id: 1, name: 'Admin' }, { id: 2, name: 'User' }];

  missionForm: MissionDto = {
    missionTitle: '',
    missionDescription: '',
    missionOrganisationName: '',
    missionOrganisationDetail: '',
    countryId: 0,
    cityId: 0,
    missionThemeId: 0,
    missionType: 'Active',
    totalSeats: 0,
    missionSkillId: '',
    missionImages: '',
    missionDocuments: '',
    missionAvailability: 'Daily',
    missionVideoUrl: '',
    isActive: true
  };

  selectedSkillIds: number[] = [];


  themeForm: MissionTheme = { id: 0, name: '' };
  skillForm: MissionSkill = { id: 0, name: '' };

  // Edit modes
  editingUserId: number | null = null;
  editingMissionId: number | null = null;
  editingThemeId: number | null = null;
  editingSkillId: number | null = null;

  constructor(
    private authService: AuthService,
    private router: Router,
    private userService: UserService,
    private missionService: MissionService,
    private missionThemeService: MissionThemeService,
    private missionSkillService: MissionSkillService,
    private locationService: LocationService,
    private uploadService: UploadService,
    private missionApplicationService: MissionApplicationService
  ) {}

  ngOnInit(): void {
    this.loadCurrentUser();
    this.checkUserRole();
    this.loadInitialData();
    this.loadCountries();
    this.loadAllApplications();
  }


  loadAllApplications(): void {
  this.applicationsLoading = true;
  this.missionApplicationService.getPendingApplications().subscribe({
    next: (data) => {
      this.allApplications = data;
      this.applicationsLoading = false;
    },
    error: (err) => {
      console.error('Error loading applications:', err);
      this.applicationsLoading = false;
    }
  });
}

updateApplicationStatus(id: number, status: 'approved' | 'rejected'): void {
  this.missionApplicationService.updateApplicationStatus(id, status).subscribe({
    next: () => {
      const app = this.allApplications.find(a => a.id === id);
      if (app) app.status = status;
    },
    error: (err) => {
      console.error(`Failed to ${status} application`, err);
    }
  });
}

  loadCountries(): void {
    this.locationService.getCountries().subscribe({
      next: (res) => this.countries = res,
      error: (err) => console.error('Failed to load countries', err)
    });
  }

  onCountryChange(): void {
    const countryId = this.missionForm.countryId;
    if (countryId) {
      this.locationService.getCitiesByCountry(countryId).subscribe({
        next: (res) => this.cities = res,
        error: (err) => console.error('Failed to load cities', err)
      });
    } else {
      this.cities = [];
    }
  }


  loadCurrentUser(): void {
    this.currentUser = this.authService.getCurrentUser();
  }

  checkUserRole(): void {
    if (!this.currentUser || this.currentUser.role !== 'Admin') {
      this.router.navigate(['/login']);
    }
  }

  loadInitialData(): void {
    this.loadUsers();
    this.loadMissions();
    this.loadThemes();
    this.loadSkills();
  }

  setActiveMenuItem(menuItem: string): void {
    this.activeMenuItem = menuItem;
  }

  toggleSidebar(): void {
    this.sidebarCollapsed = !this.sidebarCollapsed;
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  // Updated navigation methods in your component
  // Add these methods or update existing ones in your AdminViewComponent

  navigateToUsers(event?: Event): void {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setActiveMenuItem('users');
    this.loadUsers();
  }

  navigateToMissions(event?: Event): void {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setActiveMenuItem('missions');
    this.loadMissions();
  }

  navigateToMissionThemes(event?: Event): void {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setActiveMenuItem('mission-themes');
    this.loadThemes();
  }

  navigateToMissionSkills(event?: Event): void {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setActiveMenuItem('mission-skills');
    this.loadSkills();
  }

  navigateToMissionApplications(event?: Event): void {
    if (event) {
      event.preventDefault();
      event.stopPropagation();
    }
    this.setActiveMenuItem('mission-applications');
    // TODO: Implement mission applications management functionality
  }

  // Data loading functions
  loadUsers(): void {
    this.usersLoading = true;
    this.userService.getAllUsers().subscribe({
      next: (users) => {
        this.users = users;
        this.usersLoading = false;
      },
      error: (error) => {
        console.error('Error loading users:', error);
        this.usersLoading = false;
      }
    });
  }

  loadMissions(): void {
    this.missionsLoading = true;
    this.missionService.getAllMissions().subscribe({
      next: (missions) => {
        this.missions = missions;
        this.missionsLoading = false;
      },
      error: (error) => {
        console.error('Error loading missions:', error);
        this.missionsLoading = false;
      }
    });
  }

  loadThemes(): void {
    this.themesLoading = true;
    this.missionThemeService.getAllThemes().subscribe({
      next: (themes) => {
        this.missionThemes = themes;
        this.themesLoading = false;
      },
      error: (error) => {
        console.error('Error loading themes:', error);
        this.themesLoading = false;
      }
    });
  }

  loadSkills(): void {
    this.skillsLoading = true;
    this.missionSkillService.getAllSkills().subscribe({
      next: (skills) => {
        this.missionSkills = skills;
        this.skillsLoading = false;
      },
      error: (error) => {
        console.error('Error loading skills:', error);
        this.skillsLoading = false;
      }
    });
  }


  editUser(user: any): void {
    this.userForm = {
      firstName: user.firstName || '',
      lastName: user.lastName || '',
      phoneNumber: user.phoneNumber || '',
      emailAddress: user.emailAddress || '',
      password: '', // never pre-fill password
      roleId: user.roleId || 0  // ensure roleId is present in your table data
    };
    this.editingUserId = user.id;
    this.showUserForm = true;
  }


  saveUser(): void {
  if (this.editingUserId) {
    this.userService.updateUser(this.editingUserId, this.userForm).subscribe({
      next: () => {
        this.loadUsers();
        this.cancelUserForm();
      },
      error: (error) => console.error('Error updating user:', error)
    });
  } else {
    this.userService.createUser(this.userForm).subscribe({
      next: () => {
        this.loadUsers();
        this.cancelUserForm();
      },
      error: (error) => console.error('Error creating user:', error)
    });
    }
  }


  deleteUser(id: number): void {
    if (confirm('Are you sure you want to delete this user?')) {
      this.userService.deleteUser(id).subscribe({
        next: () => this.loadUsers(),
        error: (error) => console.error('Error deleting user:', error)
      });
    }
  }

  cancelUserForm(): void {
    this.showUserForm = false;
    this.editingUserId = null;
    this.userForm = {
      firstName: '',
      lastName: '',
      emailAddress: '',
      password: '',
      roleId: 2,
      phoneNumber: ''
    };
  }

  showAddUserForm(): void {
    this.userForm = {
      firstName: '',
      lastName: '',
      emailAddress: '',
      password: '',
      roleId: 2,
      phoneNumber: ''
    };
    this.editingUserId = null;
    this.showUserForm = true;
  }

  // Mission management functions
  showAddMissionForm(): void {
    this.missionForm = {
      missionTitle: '',
      missionDescription: '',
      missionOrganisationName: '',
      missionOrganisationDetail: '',
      countryId: 0,
      cityId: 0,
      missionThemeId: 0,
      missionType: 'Active',
      totalSeats: 0,
      missionSkillId: '',
      missionImages: '',
      missionDocuments: '',
      missionAvailability: 'Daily',
      missionVideoUrl: '',
      isActive: true
    };
    this.selectedSkillIds = []; // Optional helper array for checkboxes
    this.editingMissionId = null;
    this.showMissionForm = true;
  }


  editMission(mission: MissionReadDto): void {
  this.missionForm = {
    missionTitle: mission.missionTitle,
    missionDescription: mission.missionDescription,
    missionOrganisationName: mission.missionOrganisationName,
    missionOrganisationDetail: mission.missionOrganisationDetail,
    countryId: mission.countryId,
    cityId: mission.cityId,
    missionThemeId: mission.missionThemeId,
    missionType: mission.missionType,
    totalSeats: mission.totalSeats,
    missionSkillId: mission.missionSkillId, // Already comma-separated string
    missionImages: mission.missionImages || '',
    missionDocuments: mission.missionDocuments || '',
    missionAvailability: mission.missionAvailability,
    missionVideoUrl: mission.missionVideoUrl || '',
    isActive: mission.isActive
  };
  this.selectedSkillIds = mission.missionSkillId
    ? mission.missionSkillId.split(',').map(id => parseInt(id.trim()))
    : [];

  this.editingMissionId = mission.id;
  this.showMissionForm = true;
}


  saveMission(): void {
  this.missionForm.missionSkillId = this.selectedSkillIds.join(','); // Update skills before sending

  if (this.editingMissionId) {
    this.missionService.updateMission(this.editingMissionId, this.missionForm).subscribe({
      next: () => {
        this.loadMissions();
        this.cancelMissionForm();
      },
      error: (error) => console.error('Error updating mission:', error)
    });
  } else {
    this.missionService.createMission(this.missionForm).subscribe({
      next: () => {
        this.loadMissions();
        this.cancelMissionForm();
      },
      error: (error) => console.error('Error creating mission:', error)
    });
  }
}


  deleteMission(id: number): void {
    if (confirm('Are you sure you want to delete this mission?')) {
      this.missionService.deleteMission(id).subscribe({
        next: () => this.loadMissions(),
        error: (error) => console.error('Error deleting mission:', error)
      });
    }
  }

  cancelMissionForm(): void {
    this.showMissionForm = false;
    this.editingMissionId = null;
  }

  previewImageUrl: string | ArrayBuffer | null = null;

  onImageUpload(event: Event): void {
    const input = event.target as HTMLInputElement;
    const files = input.files;

    if (files && files.length > 0) {
      const file = files[0];

      // For preview
      const reader = new FileReader();
      reader.onload = () => this.previewImageUrl = reader.result;
      reader.readAsDataURL(file);

      // Actual upload
      this.uploadService.uploadImage(file).subscribe({
        next: (storedFileName) => {
          this.missionForm.missionImages = storedFileName;
        },
        error: (err) => console.error('Image upload failed', err)
      });
    }
  }

  onDocumentUpload(event: Event): void {
    const input = event.target as HTMLInputElement;
    const files = input.files;

    if (files && files.length > 0) {
      const file = files[0];

      this.uploadService.uploadDocument(file).subscribe({
        next: (storedFileName) => {
          this.missionForm.missionDocuments = storedFileName;
        },
        error: (err) => console.error('Document upload failed', err)
      });
    }
  }


  // Theme management functions
  showAddThemeForm(): void {
    this.themeForm = { id: 0, name: '' };
    this.editingThemeId = null;
    this.showThemeForm = true;
  }

  editTheme(theme: MissionTheme): void {
    this.themeForm = { ...theme };
    this.editingThemeId = theme.id;
    this.showThemeForm = true;
  }

  saveTheme(): void {
    if (this.editingThemeId) {
      this.missionThemeService.updateTheme(this.editingThemeId, this.themeForm).subscribe({
        next: () => {
          this.loadThemes();
          this.cancelThemeForm();
        },
        error: (error) => console.error('Error updating theme:', error)
      });
    } else {
      this.missionThemeService.createTheme(this.themeForm).subscribe({
        next: () => {
          this.loadThemes();
          this.cancelThemeForm();
        },
        error: (error) => console.error('Error creating theme:', error)
      });
    }
  }

  deleteTheme(id: number): void {
    if (confirm('Are you sure you want to delete this theme?')) {
      this.missionThemeService.deleteTheme(id).subscribe({
        next: () => this.loadThemes(),
        error: (error) => console.error('Error deleting theme:', error)
      });
    }
  }

  cancelThemeForm(): void {
    this.showThemeForm = false;
    this.editingThemeId = null;
  }

  // Skill management functions
  showAddSkillForm(): void {
    this.skillForm = { id: 0, name: ''};
    this.editingSkillId = null;
    this.showSkillForm = true;
  }

  editSkill(skill: MissionSkill): void {
    this.skillForm = { ...skill };
    this.editingSkillId = skill.id;
    this.showSkillForm = true;
  }

  saveSkill(): void {
    if (this.editingSkillId) {
      this.missionSkillService.updateSkill(this.editingSkillId, this.skillForm).subscribe({
        next: () => {
          this.loadSkills();
          this.cancelSkillForm();
        },
        error: (error) => console.error('Error updating skill:', error)
      });
    } else {
      this.missionSkillService.createSkill(this.skillForm).subscribe({
        next: () => {
          this.loadSkills();
          this.cancelSkillForm();
        },
        error: (error) => console.error('Error creating skill:', error)
      });
    }
  }

  deleteSkill(id: number): void {
    if (confirm('Are you sure you want to delete this skill?')) {
      this.missionSkillService.deleteSkill(id).subscribe({
        next: () => this.loadSkills(),
        error: (error) => console.error('Error deleting skill:', error)
      });
    }
  }

  cancelSkillForm(): void {
    this.showSkillForm = false;
    this.editingSkillId = null;
  }

  // Utility functions
  getUserCount(): number {
    return this.users.length;
  }

  getMissionCount(): number {
    return this.missions.length;
  }

  getApplicationCount(): number {
    // TODO: Implement actual application count from API
    return 0;
  }

  getPendingApplications(): number {
    // TODO: Implement actual pending application count from API
    return 0;
  }

  onSkillCheckboxChange(event: Event, skillId: number): void {
    const isChecked = (event.target as HTMLInputElement).checked;
    this.onSkillSelectionChange(skillId, isChecked);
  }

  onSkillSelectionChange(skillId: number, isSelected: boolean): void {
    if (isSelected) {
      if (!this.selectedSkillIds.includes(skillId)) {
        this.selectedSkillIds.push(skillId);
      }
    } else {
      this.selectedSkillIds = this.selectedSkillIds.filter(id => id !== skillId);
    }
  }

  isSkillSelected(skillId: number): boolean {
    return this.selectedSkillIds.includes(skillId);
  }


}