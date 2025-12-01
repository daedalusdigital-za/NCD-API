# Frontend Training Sessions Display Guide

## Overview
This guide provides complete instructions for building a frontend interface to display, manage, and interact with training sessions from the Medical History API.

---

## 1. TypeScript Service Layer

### `training.service.ts`
```typescript
import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface TrainingSession {
  id?: number;
  trainingName: string;
  trainingType: string;
  startDate: Date;
  endDate: Date;
  province: string;
  provinceName?: string;
  venue: string;
  trainerId: number;
  trainer?: {
    id: number;
    name: string;
    email?: string;
    provinceName?: string;
  };
  targetAudience: string;
  numberOfParticipants: number;
  status: number;
  statusText?: string;
  hospital?: string;
  trainingObjectives?: string;
  trainingMaterials?: string;
  dateCreated: Date;
  lastUpdated?: Date;
  createdByUserName?: string;
}

export interface TrainingDocument {
  id: number;
  trainingSessionId: number;
  fileName: string;
  originalFileName: string;
  fileSize: number;
  filePath: string;
  documentType: 'Register' | 'AttendanceSheet' | 'Materials';
  mimeType: string;
  uploadedBy: string;
  uploadedAt: Date;
}

@Injectable({
  providedIn: 'root'
})
export class TrainingService {
  private readonly apiUrl = 'https://ngcanduapi.azurewebsites.net/api/Training';
  
  // Status mapping
  private statusMap: { [key: number]: string } = {
    1: 'Scheduled',
    2: 'In Progress',
    3: 'Completed',
    4: 'Cancelled'
  };

  constructor(private http: HttpClient) {}

  /**
   * Get all training sessions
   */
  getAllSessions(): Observable<TrainingSession[]> {
    return this.http.get<TrainingSession[]>(`${this.apiUrl}/GetAll`);
  }

  /**
   * Get training session by ID
   */
  getSessionById(id: number): Observable<TrainingSession> {
    return this.http.get<TrainingSession>(`${this.apiUrl}/GetById`, {
      params: new HttpParams().set('id', id.toString())
    });
  }

  /**
   * Get training sessions by province
   */
  getSessionsByProvince(provinceName: string): Observable<TrainingSession[]> {
    return this.http.get<TrainingSession[]>(`${this.apiUrl}/GetByProvince`, {
      params: new HttpParams().set('provinceName', provinceName)
    });
  }

  /**
   * Get training sessions by date range
   */
  getSessionsByDateRange(startDate: Date, endDate: Date): Observable<TrainingSession[]> {
    return this.http.get<TrainingSession[]>(`${this.apiUrl}/GetByDateRange`, {
      params: new HttpParams()
        .set('startDate', startDate.toISOString())
        .set('endDate', endDate.toISOString())
    });
  }

  /**
   * Get training sessions by trainer ID
   */
  getSessionsByTrainer(trainerId: number): Observable<TrainingSession[]> {
    return this.http.get<TrainingSession[]>(`${this.apiUrl}/GetByTrainer`, {
      params: new HttpParams().set('trainerId', trainerId.toString())
    });
  }

  /**
   * Add new training session (requires JWT token)
   */
  addSession(session: TrainingSession, token: string): Observable<any> {
    return this.http.post(`${this.apiUrl}/Add`, session, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
  }

  /**
   * Update training session (requires JWT token)
   */
  updateSession(session: TrainingSession, token: string): Observable<any> {
    return this.http.patch(`${this.apiUrl}/Update`, session, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
  }

  /**
   * Delete training session (requires JWT token)
   */
  deleteSession(id: number, token: string): Observable<any> {
    return this.http.delete(`${this.apiUrl}/Delete`, {
      params: new HttpParams().set('id', id.toString()),
      headers: { 'Authorization': `Bearer ${token}` }
    });
  }

  /**
   * Upload PDF document (requires JWT token)
   */
  uploadPDF(
    trainingSessionId: number,
    file: File,
    documentType: 'Register' | 'AttendanceSheet' | 'Materials',
    token: string
  ): Observable<any> {
    const formData = new FormData();
    formData.append('trainingSessionId', trainingSessionId.toString());
    formData.append('file', file);
    formData.append('documentType', documentType);

    return this.http.post(`${this.apiUrl}/UploadPDF`, formData, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
  }

  /**
   * Download PDF document
   */
  downloadPDF(documentId: number, fileName: string): void {
    this.http.get(`${this.apiUrl}/DownloadPDF/${documentId}`, {
      responseType: 'blob'
    }).subscribe(
      (data: Blob) => {
        const url = window.URL.createObjectURL(data);
        const a = document.createElement('a');
        a.href = url;
        a.download = fileName;
        a.click();
        window.URL.revokeObjectURL(url);
      },
      (error) => console.error('Download failed:', error)
    );
  }

  /**
   * Get training documents for a session
   */
  getSessionDocuments(trainingSessionId: number): Observable<TrainingDocument[]> {
    return this.http.get<TrainingDocument[]>(
      `${this.apiUrl}/${trainingSessionId}/PDFs`
    );
  }

  /**
   * Delete training document (requires JWT token)
   */
  deleteDocument(documentId: number, token: string): Observable<any> {
    return this.http.delete(`${this.apiUrl}/DeletePDF/${documentId}`, {
      headers: { 'Authorization': `Bearer ${token}` }
    });
  }

  /**
   * Get status text for status code
   */
  getStatusText(status: number): string {
    return this.statusMap[status] || 'Unknown';
  }

  /**
   * Format file size for display
   */
  formatFileSize(bytes: number): string {
    if (bytes === 0) return '0 Bytes';
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB'];
    const i = Math.floor(Math.log(bytes) / Math.log(k));
    return Math.round((bytes / Math.pow(k, i)) * 100) / 100 + ' ' + sizes[i];
  }
}
```

---

## 2. Angular Component - Training Sessions List

### `training-sessions-list.component.ts`
```typescript
import { Component, OnInit } from '@angular/core';
import { TrainingService, TrainingSession } from '../services/training.service';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { ViewChild } from '@angular/core';

@Component({
  selector: 'app-training-sessions-list',
  templateUrl: './training-sessions-list.component.html',
  styleUrls: ['./training-sessions-list.component.css']
})
export class TrainingSessionsListComponent implements OnInit {
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  sessions: TrainingSession[] = [];
  dataSource = new MatTableDataSource<TrainingSession>([]);
  displayedColumns: string[] = [
    'trainingName',
    'trainingType',
    'startDate',
    'endDate',
    'province',
    'venue',
    'trainer',
    'participants',
    'status',
    'actions'
  ];

  loading = false;
  error: string | null = null;
  filterProvince = '';
  filterStatus = '';

  constructor(private trainingService: TrainingService) {}

  ngOnInit(): void {
    this.loadAllSessions();
  }

  /**
   * Load all training sessions
   */
  loadAllSessions(): void {
    this.loading = true;
    this.error = null;

    this.trainingService.getAllSessions().subscribe({
      next: (data) => {
        this.sessions = data;
        // Add status text to each session
        this.sessions.forEach(session => {
          session.statusText = this.trainingService.getStatusText(session.status);
        });
        this.applyFilters();
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load training sessions';
        console.error(err);
        this.loading = false;
      }
    });
  }

  /**
   * Load sessions by province
   */
  loadByProvince(province: string): void {
    if (!province) {
      this.loadAllSessions();
      return;
    }

    this.loading = true;
    this.error = null;

    this.trainingService.getSessionsByProvince(province).subscribe({
      next: (data) => {
        this.sessions = data;
        this.sessions.forEach(session => {
          session.statusText = this.trainingService.getStatusText(session.status);
        });
        this.dataSource.data = this.sessions;
        this.loading = false;
      },
      error: (err) => {
        this.error = `Failed to load sessions for ${province}`;
        console.error(err);
        this.loading = false;
      }
    });
  }

  /**
   * Load sessions by date range
   */
  loadByDateRange(startDate: Date, endDate: Date): void {
    this.loading = true;
    this.error = null;

    this.trainingService.getSessionsByDateRange(startDate, endDate).subscribe({
      next: (data) => {
        this.sessions = data;
        this.sessions.forEach(session => {
          session.statusText = this.trainingService.getStatusText(session.status);
        });
        this.dataSource.data = this.sessions;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load sessions for date range';
        console.error(err);
        this.loading = false;
      }
    });
  }

  /**
   * Apply filters to the data
   */
  applyFilters(): void {
    let filtered = this.sessions;

    if (this.filterStatus) {
      filtered = filtered.filter(s => s.status.toString() === this.filterStatus);
    }

    this.dataSource.data = filtered;
  }

  /**
   * View session details
   */
  viewDetails(sessionId?: number): void {
    if (sessionId) {
      console.log('Navigate to details for session:', sessionId);
      // Router.navigate(['/training/details', sessionId]);
    }
  }

  /**
   * Edit session
   */
  editSession(session: TrainingSession): void {
    console.log('Edit session:', session);
    // Router.navigate(['/training/edit', session.id]);
  }

  /**
   * Delete session
   */
  deleteSession(sessionId?: number): void {
    if (!sessionId) return;

    if (!confirm('Are you sure you want to delete this training session?')) {
      return;
    }

    const token = localStorage.getItem('authToken') || '';
    this.trainingService.deleteSession(sessionId, token).subscribe({
      next: () => {
        this.loadAllSessions();
      },
      error: (err) => {
        this.error = 'Failed to delete training session';
        console.error(err);
      }
    });
  }

  /**
   * Format date for display
   */
  formatDate(date: Date | string): string {
    const d = new Date(date);
    return d.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'short',
      day: '2-digit'
    });
  }

  /**
   * Get status badge color
   */
  getStatusColor(status: number): string {
    switch (status) {
      case 1: return 'primary';    // Scheduled
      case 2: return 'accent';     // In Progress
      case 3: return 'success';    // Completed
      case 4: return 'warn';       // Cancelled
      default: return 'primary';
    }
  }
}
```

### `training-sessions-list.component.html`
```html
<div class="training-sessions-container">
  <h1>Training Sessions</h1>

  <!-- Error Message -->
  <mat-error *ngIf="error" class="error-message">
    {{ error }}
    <button mat-icon-button (click)="error = null">
      <mat-icon>close</mat-icon>
    </button>
  </mat-error>

  <!-- Filters Section -->
  <mat-card class="filters-card">
    <mat-card-header>
      <mat-card-title>Filters & Search</mat-card-title>
    </mat-card-header>
    <mat-card-content>
      <div class="filter-row">
        <mat-form-field appearance="outline">
          <mat-label>Filter by Province</mat-label>
          <input matInput [(ngModel)]="filterProvince" 
                 (change)="loadByProvince(filterProvince)"
                 placeholder="e.g., Western Cape">
        </mat-form-field>

        <mat-form-field appearance="outline">
          <mat-label>Filter by Status</mat-label>
          <mat-select [(ngModel)]="filterStatus" (change)="applyFilters()">
            <mat-option value="">All</mat-option>
            <mat-option value="1">Scheduled</mat-option>
            <mat-option value="2">In Progress</mat-option>
            <mat-option value="3">Completed</mat-option>
            <mat-option value="4">Cancelled</mat-option>
          </mat-select>
        </mat-form-field>

        <button mat-raised-button color="primary" (click)="loadAllSessions()">
          <mat-icon>refresh</mat-icon>
          Refresh
        </button>
      </div>
    </mat-card-content>
  </mat-card>

  <!-- Loading Spinner -->
  <mat-spinner *ngIf="loading" class="loading-spinner"></mat-spinner>

  <!-- Training Sessions Table -->
  <mat-card class="sessions-table-card" *ngIf="!loading">
    <mat-card-header>
      <mat-card-title>
        {{ dataSource.data.length }} Training Sessions
      </mat-card-title>
    </mat-card-header>
    <mat-card-content>
      <div class="table-responsive">
        <table mat-table [dataSource]="dataSource" class="sessions-table">
          
          <!-- Training Name Column -->
          <ng-container matColumnDef="trainingName">
            <th mat-header-cell *matHeaderCellDef>Training Name</th>
            <td mat-cell *matCellDef="let element">
              <strong>{{ element.trainingName }}</strong>
            </td>
          </ng-container>

          <!-- Training Type Column -->
          <ng-container matColumnDef="trainingType">
            <th mat-header-cell *matHeaderCellDef>Type</th>
            <td mat-cell *matCellDef="let element">
              <mat-chip-set aria-label="Training type">
                <mat-chip [highlighted]="element.trainingType === 'Technical'">
                  {{ element.trainingType }}
                </mat-chip>
              </mat-chip-set>
            </td>
          </ng-container>

          <!-- Start Date Column -->
          <ng-container matColumnDef="startDate">
            <th mat-header-cell *matHeaderCellDef>Start Date</th>
            <td mat-cell *matCellDef="let element">
              {{ formatDate(element.startDate) }}
            </td>
          </ng-container>

          <!-- End Date Column -->
          <ng-container matColumnDef="endDate">
            <th mat-header-cell *matHeaderCellDef>End Date</th>
            <td mat-cell *matCellDef="let element">
              {{ formatDate(element.endDate) }}
            </td>
          </ng-container>

          <!-- Province Column -->
          <ng-container matColumnDef="province">
            <th mat-header-cell *matHeaderCellDef>Province</th>
            <td mat-cell *matCellDef="let element">
              {{ element.provinceName || element.province }}
            </td>
          </ng-container>

          <!-- Venue Column -->
          <ng-container matColumnDef="venue">
            <th mat-header-cell *matHeaderCellDef>Venue</th>
            <td mat-cell *matCellDef="let element">
              {{ element.venue }}
            </td>
          </ng-container>

          <!-- Trainer Column -->
          <ng-container matColumnDef="trainer">
            <th mat-header-cell *matHeaderCellDef>Trainer</th>
            <td mat-cell *matCellDef="let element">
              {{ element.trainer?.name || 'N/A' }}
            </td>
          </ng-container>

          <!-- Participants Column -->
          <ng-container matColumnDef="participants">
            <th mat-header-cell *matHeaderCellDef>Participants</th>
            <td mat-cell *matCellDef="let element">
              {{ element.numberOfParticipants }}
            </td>
          </ng-container>

          <!-- Status Column -->
          <ng-container matColumnDef="status">
            <th mat-header-cell *matHeaderCellDef>Status</th>
            <td mat-cell *matCellDef="let element">
              <mat-chip-set aria-label="Status">
                <mat-chip [color]="getStatusColor(element.status)" selected>
                  {{ element.statusText }}
                </mat-chip>
              </mat-chip-set>
            </td>
          </ng-container>

          <!-- Actions Column -->
          <ng-container matColumnDef="actions">
            <th mat-header-cell *matHeaderCellDef>Actions</th>
            <td mat-cell *matCellDef="let element">
              <button mat-icon-button matTooltip="View Details" 
                      (click)="viewDetails(element.id)">
                <mat-icon>visibility</mat-icon>
              </button>
              <button mat-icon-button matTooltip="Edit" 
                      (click)="editSession(element)">
                <mat-icon>edit</mat-icon>
              </button>
              <button mat-icon-button matTooltip="Delete" 
                      (click)="deleteSession(element.id)"
                      color="warn">
                <mat-icon>delete</mat-icon>
              </button>
            </td>
          </ng-container>

          <tr mat-header-row *matHeaderRowDef="displayedColumns"></tr>
          <tr mat-row *matRowDef="let row; columns: displayedColumns;"></tr>
        </table>
      </div>

      <!-- No Data Message -->
      <div *ngIf="dataSource.data.length === 0 && !loading" class="no-data">
        <mat-icon>info</mat-icon>
        <p>No training sessions found</p>
      </div>
    </mat-card-content>

    <!-- Paginator -->
    <mat-paginator #paginator [pageSizeOptions]="[5, 10, 25, 50]" 
                   showFirstLastButtons pageSize="10">
    </mat-paginator>
  </mat-card>
</div>
```

### `training-sessions-list.component.css`
```css
.training-sessions-container {
  padding: 20px;
  max-width: 1400px;
  margin: 0 auto;
}

h1 {
  color: #333;
  margin-bottom: 20px;
  font-size: 28px;
  font-weight: 500;
}

.error-message {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
  padding: 12px;
  background-color: #ffebee;
  border-left: 4px solid #c62828;
}

.filters-card {
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}

.filter-row {
  display: flex;
  gap: 16px;
  align-items: flex-end;
  flex-wrap: wrap;
}

mat-form-field {
  min-width: 200px;
}

.loading-spinner {
  display: flex;
  justify-content: center;
  margin: 40px 0;
}

.sessions-table-card {
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.table-responsive {
  width: 100%;
  overflow-x: auto;
}

.sessions-table {
  width: 100%;
  border-collapse: collapse;
}

.sessions-table th {
  background-color: #f5f5f5;
  font-weight: 600;
  padding: 12px;
  text-align: left;
}

.sessions-table td {
  padding: 12px;
  border-bottom: 1px solid #e0e0e0;
}

.sessions-table tr:hover {
  background-color: #f9f9f9;
}

mat-chip {
  margin: 4px 0;
}

.no-data {
  text-align: center;
  padding: 40px;
  color: #999;
}

.no-data mat-icon {
  font-size: 48px;
  height: 48px;
  width: 48px;
  margin-bottom: 16px;
  color: #ccc;
}

button[mat-icon-button] {
  margin: 0 4px;
}

mat-paginator {
  border-top: 1px solid #e0e0e0;
}
```

---

## 3. Training Session Details Component

### `training-session-details.component.ts`
```typescript
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TrainingService, TrainingSession, TrainingDocument } from '../services/training.service';

@Component({
  selector: 'app-training-session-details',
  templateUrl: './training-session-details.component.html',
  styleUrls: ['./training-session-details.component.css']
})
export class TrainingSessionDetailsComponent implements OnInit {
  session: TrainingSession | null = null;
  documents: TrainingDocument[] = [];
  loading = false;
  error: string | null = null;
  sessionId: number | null = null;

  constructor(
    private trainingService: TrainingService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.sessionId = Number(this.route.snapshot.paramMap.get('id'));
    if (this.sessionId) {
      this.loadSessionDetails();
      this.loadDocuments();
    }
  }

  /**
   * Load training session details
   */
  loadSessionDetails(): void {
    if (!this.sessionId) return;

    this.loading = true;
    this.error = null;

    this.trainingService.getSessionById(this.sessionId).subscribe({
      next: (data) => {
        this.session = data;
        this.session.statusText = this.trainingService.getStatusText(this.session.status);
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load session details';
        console.error(err);
        this.loading = false;
      }
    });
  }

  /**
   * Load training documents
   */
  loadDocuments(): void {
    if (!this.sessionId) return;

    this.trainingService.getSessionDocuments(this.sessionId).subscribe({
      next: (data) => {
        this.documents = data;
      },
      error: (err) => {
        console.error('Failed to load documents:', err);
      }
    });
  }

  /**
   * Upload document
   */
  onFileSelected(event: Event, documentType: 'Register' | 'AttendanceSheet' | 'Materials'): void {
    const input = event.target as HTMLInputElement;
    if (!input.files || !this.sessionId) return;

    const file = input.files[0];
    const token = localStorage.getItem('authToken') || '';

    this.trainingService.uploadPDF(this.sessionId, file, documentType, token).subscribe({
      next: () => {
        this.loadDocuments();
      },
      error: (err) => {
        this.error = 'Failed to upload document';
        console.error(err);
      }
    });
  }

  /**
   * Download document
   */
  downloadDocument(doc: TrainingDocument): void {
    this.trainingService.downloadPDF(doc.id, doc.originalFileName);
  }

  /**
   * Delete document
   */
  deleteDocument(docId: number): void {
    if (!confirm('Are you sure you want to delete this document?')) {
      return;
    }

    const token = localStorage.getItem('authToken') || '';
    this.trainingService.deleteDocument(docId, token).subscribe({
      next: () => {
        this.loadDocuments();
      },
      error: (err) => {
        this.error = 'Failed to delete document';
        console.error(err);
      }
    });
  }

  /**
   * Format date for display
   */
  formatDate(date: Date | string): string {
    const d = new Date(date);
    return d.toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  /**
   * Get formatted file size
   */
  formatFileSize(bytes: number): string {
    return this.trainingService.formatFileSize(bytes);
  }

  /**
   * Get status color
   */
  getStatusColor(status: number): string {
    switch (status) {
      case 1: return 'primary';
      case 2: return 'accent';
      case 3: return 'success';
      case 4: return 'warn';
      default: return 'primary';
    }
  }
}
```

### `training-session-details.component.html`
```html
<div class="details-container" *ngIf="!loading; else loadingTemplate">
  <div class="header">
    <button mat-icon-button routerLink="/training">
      <mat-icon>arrow_back</mat-icon>
    </button>
    <h1>{{ session?.trainingName }}</h1>
  </div>

  <mat-error *ngIf="error">{{ error }}</mat-error>

  <div class="content-grid" *ngIf="session">
    <!-- Main Information Card -->
    <mat-card class="info-card">
      <mat-card-header>
        <mat-card-title>Session Information</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <div class="info-row">
          <span class="label">Training Type:</span>
          <span class="value">{{ session.trainingType }}</span>
        </div>
        <div class="info-row">
          <span class="label">Status:</span>
          <mat-chip-set>
            <mat-chip [color]="getStatusColor(session.status)" selected>
              {{ session.statusText }}
            </mat-chip>
          </mat-chip-set>
        </div>
        <div class="info-row">
          <span class="label">Start Date:</span>
          <span class="value">{{ formatDate(session.startDate) }}</span>
        </div>
        <div class="info-row">
          <span class="label">End Date:</span>
          <span class="value">{{ formatDate(session.endDate) }}</span>
        </div>
        <div class="info-row">
          <span class="label">Province:</span>
          <span class="value">{{ session.provinceName || session.province }}</span>
        </div>
        <div class="info-row">
          <span class="label">Venue:</span>
          <span class="value">{{ session.venue }}</span>
        </div>
        <div class="info-row" *ngIf="session.hospital">
          <span class="label">Hospital:</span>
          <span class="value">{{ session.hospital }}</span>
        </div>
      </mat-card-content>
    </mat-card>

    <!-- Trainer & Participants Card -->
    <mat-card class="info-card">
      <mat-card-header>
        <mat-card-title>Trainer & Participants</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <div class="info-row">
          <span class="label">Trainer:</span>
          <span class="value">{{ session.trainer?.name || 'N/A' }}</span>
        </div>
        <div class="info-row" *ngIf="session.trainer?.email">
          <span class="label">Email:</span>
          <span class="value">
            <a href="mailto:{{ session.trainer.email }}">
              {{ session.trainer.email }}
            </a>
          </span>
        </div>
        <div class="info-row">
          <span class="label">Number of Participants:</span>
          <span class="value">{{ session.numberOfParticipants }}</span>
        </div>
        <div class="info-row">
          <span class="label">Target Audience:</span>
          <span class="value">{{ session.targetAudience }}</span>
        </div>
      </mat-card-content>
    </mat-card>

    <!-- Description Card -->
    <mat-card class="info-card full-width" *ngIf="session.trainingObjectives || session.trainingMaterials">
      <mat-card-header>
        <mat-card-title>Training Details</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <div *ngIf="session.trainingObjectives">
          <h3>Objectives</h3>
          <p>{{ session.trainingObjectives }}</p>
        </div>
        <div *ngIf="session.trainingMaterials">
          <h3>Materials</h3>
          <p>{{ session.trainingMaterials }}</p>
        </div>
      </mat-card-content>
    </mat-card>

    <!-- Documents Card -->
    <mat-card class="documents-card full-width">
      <mat-card-header>
        <mat-card-title>Documents</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <!-- Upload Section -->
        <div class="upload-section">
          <h3>Upload Document</h3>
          <div class="upload-buttons">
            <button mat-raised-button color="primary">
              <mat-icon>upload_file</mat-icon>
              <input hidden type="file" accept=".pdf" 
                     (change)="onFileSelected($event, 'Register')">
              Register
            </button>
            <button mat-raised-button color="primary">
              <mat-icon>upload_file</mat-icon>
              <input hidden type="file" accept=".pdf" 
                     (change)="onFileSelected($event, 'AttendanceSheet')">
              Attendance Sheet
            </button>
            <button mat-raised-button color="primary">
              <mat-icon>upload_file</mat-icon>
              <input hidden type="file" accept=".pdf" 
                     (change)="onFileSelected($event, 'Materials')">
              Materials
            </button>
          </div>
        </div>

        <!-- Documents List -->
        <h3>Documents List</h3>
        <mat-table [dataSource]="documents" *ngIf="documents.length > 0">
          <ng-container matColumnDef="fileName">
            <th mat-header-cell *matHeaderCellDef>File Name</th>
            <td mat-cell *matCellDef="let doc">{{ doc.originalFileName }}</td>
          </ng-container>

          <ng-container matColumnDef="type">
            <th mat-header-cell *matHeaderCellDef>Type</th>
            <td mat-cell *matCellDef="let doc">{{ doc.documentType }}</td>
          </ng-container>

          <ng-container matColumnDef="size">
            <th mat-header-cell *matHeaderCellDef>Size</th>
            <td mat-cell *matCellDef="let doc">{{ formatFileSize(doc.fileSize) }}</td>
          </ng-container>

          <ng-container matColumnDef="uploadedAt">
            <th mat-header-cell *matHeaderCellDef>Uploaded</th>
            <td mat-cell *matCellDef="let doc">{{ formatDate(doc.uploadedAt) }}</td>
          </ng-container>

          <ng-container matColumnDef="actions">
            <th mat-header-cell *matHeaderCellDef>Actions</th>
            <td mat-cell *matCellDef="let doc">
              <button mat-icon-button matTooltip="Download"
                      (click)="downloadDocument(doc)">
                <mat-icon>download</mat-icon>
              </button>
              <button mat-icon-button matTooltip="Delete" color="warn"
                      (click)="deleteDocument(doc.id)">
                <mat-icon>delete</mat-icon>
              </button>
            </td>
          </ng-container>

          <tr mat-header-row *matHeaderRowDef="['fileName', 'type', 'size', 'uploadedAt', 'actions']"></tr>
          <tr mat-row *matRowDef="let row; columns: ['fileName', 'type', 'size', 'uploadedAt', 'actions'];"></tr>
        </mat-table>

        <div *ngIf="documents.length === 0" class="no-documents">
          <mat-icon>description</mat-icon>
          <p>No documents uploaded yet</p>
        </div>
      </mat-card-content>
    </mat-card>

    <!-- Audit Information -->
    <mat-card class="audit-card full-width">
      <mat-card-header>
        <mat-card-title>Audit Information</mat-card-title>
      </mat-card-header>
      <mat-card-content>
        <div class="info-row">
          <span class="label">Created By:</span>
          <span class="value">{{ session.createdByUserName || 'N/A' }}</span>
        </div>
        <div class="info-row">
          <span class="label">Created Date:</span>
          <span class="value">{{ formatDate(session.dateCreated) }}</span>
        </div>
        <div class="info-row" *ngIf="session.lastUpdated">
          <span class="label">Last Updated:</span>
          <span class="value">{{ formatDate(session.lastUpdated) }}</span>
        </div>
      </mat-card-content>
    </mat-card>
  </div>
</div>

<ng-template #loadingTemplate>
  <div class="loading-container">
    <mat-spinner></mat-spinner>
    <p>Loading training session details...</p>
  </div>
</ng-template>
```

### `training-session-details.component.css`
```css
.details-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
}

.header {
  display: flex;
  align-items: center;
  margin-bottom: 30px;
  gap: 16px;
}

.header h1 {
  color: #333;
  font-size: 32px;
  font-weight: 300;
  margin: 0;
}

.content-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  margin-bottom: 20px;
}

.full-width {
  grid-column: 1 / -1;
}

.info-card {
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.info-row {
  display: flex;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px solid #f0f0f0;
}

.info-row:last-child {
  border-bottom: none;
}

.label {
  font-weight: 600;
  color: #666;
  min-width: 150px;
  margin-right: 16px;
}

.value {
  color: #333;
  flex: 1;
}

.value a {
  color: #1976d2;
  text-decoration: none;
}

.value a:hover {
  text-decoration: underline;
}

mat-card-header {
  margin-bottom: 16px;
}

.documents-card {
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.upload-section {
  margin-bottom: 30px;
  padding-bottom: 20px;
  border-bottom: 1px solid #e0e0e0;
}

.upload-section h3 {
  margin-top: 0;
  margin-bottom: 16px;
  color: #333;
}

.upload-buttons {
  display: flex;
  gap: 12px;
  flex-wrap: wrap;
}

.upload-buttons button {
  position: relative;
}

.upload-buttons input {
  cursor: pointer;
}

.no-documents {
  text-align: center;
  padding: 40px 20px;
  color: #999;
}

.no-documents mat-icon {
  font-size: 48px;
  height: 48px;
  width: 48px;
  margin-bottom: 16px;
  color: #ccc;
}

.audit-card {
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  background-color: #fafafa;
}

.loading-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  min-height: 400px;
}

.loading-container p {
  margin-top: 16px;
  color: #666;
}

mat-table {
  width: 100%;
  margin-top: 16px;
}

mat-table th {
  background-color: #f5f5f5;
  font-weight: 600;
}

mat-table td {
  padding: 12px;
}

@media (max-width: 768px) {
  .content-grid {
    grid-template-columns: 1fr;
  }

  .header {
    flex-direction: column;
    align-items: flex-start;
  }

  .upload-buttons {
    flex-direction: column;
  }

  .upload-buttons button {
    width: 100%;
  }
}
```

---

## 4. Module Configuration

### `app.module.ts` (Required Imports)
```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

// Material Modules
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatSelectModule } from '@angular/material/select';
import { MatChipsModule } from '@angular/material/chips';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatTooltipModule } from '@angular/material/tooltip';

import { AppComponent } from './app.component';
import { TrainingSessionsListComponent } from './components/training-sessions-list/training-sessions-list.component';
import { TrainingSessionDetailsComponent } from './components/training-session-details/training-session-details.component';
import { TrainingService } from './services/training.service';

@NgModule({
  declarations: [
    AppComponent,
    TrainingSessionsListComponent,
    TrainingSessionDetailsComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatIconModule,
    MatSelectModule,
    MatChipsModule,
    MatProgressSpinnerModule,
    MatTooltipModule
  ],
  providers: [TrainingService],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

---

## 5. Routing Configuration

### `app-routing.module.ts`
```typescript
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TrainingSessionsListComponent } from './components/training-sessions-list/training-sessions-list.component';
import { TrainingSessionDetailsComponent } from './components/training-session-details/training-session-details.component';

const routes: Routes = [
  {
    path: 'training',
    component: TrainingSessionsListComponent,
    data: { title: 'Training Sessions' }
  },
  {
    path: 'training/details/:id',
    component: TrainingSessionDetailsComponent,
    data: { title: 'Training Session Details' }
  },
  {
    path: '',
    redirectTo: '/training',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
```

---

## 6. Key Features Implementation

### Authentication & Token Management
```typescript
// In your auth service or interceptor
export class AuthInterceptor implements HttpInterceptor {
  constructor(private authService: AuthService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    const token = localStorage.getItem('authToken');
    
    if (token) {
      req = req.clone({
        setHeaders: {
          Authorization: `Bearer ${token}`
        }
      });
    }
    
    return next.handle(req);
  }
}
```

### Date Range Filtering
```typescript
// In component
dateRange = {
  start: new Date(new Date().getFullYear(), 0, 1),
  end: new Date()
};

onDateRangeChange(): void {
  this.loadByDateRange(this.dateRange.start, this.dateRange.end);
}
```

### Export to CSV
```typescript
exportToCSV(): void {
  const csv = [
    ['Training Name', 'Type', 'Start Date', 'End Date', 'Province', 'Trainer', 'Participants', 'Status'],
    ...this.sessions.map(s => [
      s.trainingName,
      s.trainingType,
      this.formatDate(s.startDate),
      this.formatDate(s.endDate),
      s.provinceName,
      s.trainer?.name || '',
      s.numberOfParticipants,
      s.statusText
    ])
  ].map(row => row.join(',')).join('\n');

  const blob = new Blob([csv], { type: 'text/csv' });
  const url = window.URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'training-sessions.csv';
  a.click();
  window.URL.revokeObjectURL(url);
}
```

---

## 7. API Testing URLs

```
# Get All Sessions
GET https://ngcanduapi.azurewebsites.net/api/Training/GetAll

# Get Session by ID
GET https://ngcanduapi.azurewebsites.net/api/Training/GetById?id=1

# Get by Province
GET https://ngcanduapi.azurewebsites.net/api/Training/GetByProvince?provinceName=Western%20Cape

# Get by Date Range
GET https://ngcanduapi.azurewebsites.net/api/Training/GetByDateRange?startDate=2025-01-01T00:00:00&endDate=2025-12-31T23:59:59

# Get by Trainer
GET https://ngcanduapi.azurewebsites.net/api/Training/GetByTrainer?trainerId=1

# Get Session Documents
GET https://ngcanduapi.azurewebsites.net/api/Training/1/PDFs

# Upload PDF (requires auth)
POST https://ngcanduapi.azurewebsites.net/api/Training/UploadPDF
Content-Type: multipart/form-data
Authorization: Bearer <token>

# Download PDF
GET https://ngcanduapi.azurewebsites.net/api/Training/DownloadPDF/1

# Delete Document (requires auth)
DELETE https://ngcanduapi.azurewebsites.net/api/Training/DeletePDF/1
Authorization: Bearer <token>
```

---

## 8. Best Practices

1. **Error Handling**: Always wrap API calls in try-catch or subscribe error handlers
2. **Loading States**: Show spinners during data fetching
3. **Pagination**: Use Material pagination for large datasets
4. **Caching**: Implement RxJS shareReplay() for frequently accessed data
5. **Input Validation**: Validate file types and sizes before upload
6. **JWT Tokens**: Store in localStorage/sessionStorage, refresh before expiry
7. **Responsive Design**: Use CSS Grid/Flexbox for mobile compatibility
8. **Accessibility**: Add matTooltip, aria-labels for screen readers

---

## 9. Troubleshooting

| Issue | Solution |
|-------|----------|
| CORS errors | Configure CORS in API (already done) |
| 401 Unauthorized | Check JWT token expiry, re-authenticate |
| File upload fails | Verify file size < 10MB, format is PDF |
| No data displayed | Check API endpoint URL, network tab for 404s |
| Date formatting issues | Use `toISOString()` for API, `toLocaleDateString()` for display |

