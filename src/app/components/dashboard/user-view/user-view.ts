import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';
import { AuthService } from '../../../services/auth';
import { MissionService, MissionReadDto, MissionApplicationService } from '../../../services/user';
import { UserProfileService, UserProfile } from '../../../services/user';

@Component({
  selector: 'app-user-dashboard',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-view.html',
  styleUrls: ['./user-view.css']
})
export class UserViewComponent implements OnInit {
  currentUser: any;
  userProfile: UserProfile | null = null;
  missions: MissionReadDto[] = [];
  
  // Loading states
  missionsLoading: boolean = false;
  profileLoading: boolean = false;
  
  // Profile dropdown state
  showProfileDropdown: boolean = false;

  constructor(
    private authService: AuthService,
    private router: Router,
    private missionService: MissionService,
    private userProfileService: UserProfileService,
    private missionAppService: MissionApplicationService
  ) {}

  ngOnInit(): void {
    this.loadCurrentUser();
    this.checkUserAuth();
    this.loadUserProfile();
    this.loadMissions();
  }

  loadCurrentUser(): void {
    this.currentUser = this.authService.getCurrentUser();
  }

  checkUserAuth(): void {
    if (!this.currentUser) {
      this.router.navigate(['/login']);
    }
  }

  loadUserProfile(): void {
    this.profileLoading = true;
    this.userProfileService.getProfile().subscribe({
      next: (profile) => {
        this.userProfile = profile;
        this.profileLoading = false;
      },
      error: (error) => {
        console.error('Error loading user profile:', error);
        this.profileLoading = false;
        // Set default profile if none exists
        this.userProfile = {
          bio: 'No bio available',
          profileImageUrl: ''
        };
      }
    });
  }

  loadMissions(): void {
    this.missionsLoading = true;
    this.missionService.getAllMissions().subscribe({
      next: (missions) => {
        // Filter only active missions for users
        this.missions = missions.filter(mission => mission.isActive);
        this.missionsLoading = false;
      },
      error: (error) => {
        console.error('Error loading missions:', error);
        this.missionsLoading = false;
      }
    });
  }

  toggleProfileDropdown(): void {
    this.showProfileDropdown = !this.showProfileDropdown;
  }

  viewMissionDetails(missionId: number): void {
    // Navigate to mission details page
    this.router.navigate(['/mission-details', missionId]);
  }

  applyToMission(missionId: number): void {
  const userId = this.currentUser?.id;
  if (!userId) {
    console.error('User ID not available');
    return;
  }

  const applicationData = {
    missionId: missionId,
    motivationNote: 'I am excited to join this mission!' // You can customize or ask via dialog
  };

  this.missionAppService.applyOrUpdateApplication(userId, applicationData).subscribe({
    next: (success) => {
      if (success) {
        alert('Application submitted successfully!');
      } else {
        alert('Failed to submit application.');
      }
    },
    error: (err) => {
      console.error('Application error:', err);
      alert('An error occurred while applying.');
    }
  });
}


  navigateToProfile(): void {
    this.router.navigate(['/profile']);
    this.showProfileDropdown = false;
  }

  navigateToMyApplications(): void {
    this.router.navigate(['/my-applications']);
    this.showProfileDropdown = false;
  }

  logout(): void {
    this.authService.logout();
    this.router.navigate(['/login']);
  }

  // Utility methods
  getActiveMissionCount(): number {
    return this.missions.length;
  }

  getMissionImageUrl(mission: MissionReadDto): string {
    if (mission.missionImages) {
      // Assuming the image URL is stored directly or needs to be constructed
      return mission.missionImages;
    }
    return 'assets/images/default-mission.jpg'; // Default mission image
  }

  getProfileImageUrl(): string {
    if (this.userProfile?.profileImageUrl) {
      return this.userProfile.profileImageUrl;
    }
    return 'assets/images/default-avatar.jpg'; // Default avatar
  }

  getUserDisplayName(): string {
    if (this.currentUser?.firstName && this.currentUser?.lastName) {
      return `${this.currentUser.firstName} ${this.currentUser.lastName}`;
    }
    return this.currentUser?.username || 'User';
  }

  truncateText(text: string, maxLength: number = 100): string {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }

  showUserProfileSummary: boolean = false;

  toggleUserProfileSummary() {
    this.showUserProfileSummary = !this.showUserProfileSummary;
  }

}