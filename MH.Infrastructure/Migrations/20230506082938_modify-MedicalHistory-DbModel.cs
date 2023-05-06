using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class modifyMedicalHistoryDbModel : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastAppointmentDate",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "NextAppointmentDate",
                table: "Patient");

            migrationBuilder.AddColumn<string>(
                name: "AtInstitution",
                table: "MedicalHistory",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "BloodPressue",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Glucose",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "HBA1C",
                table: "MedicalHistory",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsMedicated",
                table: "MedicalHistory",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "KeyTone",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Lactate",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "NextAppointmentDate",
                table: "MedicalHistory",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Recomendations",
                table: "MedicalHistory",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "Remidies",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Symptoms",
                table: "MedicalHistory",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "TotalColestorl",
                table: "MedicalHistory",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UricAcid",
                table: "MedicalHistory",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AtInstitution",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "BloodPressue",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Glucose",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "HBA1C",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "IsMedicated",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "KeyTone",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Lactate",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "NextAppointmentDate",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Recomendations",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Remidies",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "Symptoms",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "TotalColestorl",
                table: "MedicalHistory");

            migrationBuilder.DropColumn(
                name: "UricAcid",
                table: "MedicalHistory");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastAppointmentDate",
                table: "Patient",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<DateTime>(
                name: "NextAppointmentDate",
                table: "Patient",
                type: "datetime2",
                nullable: true);
        }
    }
}
