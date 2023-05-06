using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addnewfieldsPatienttable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "IdNumber",
                table: "UserProfile",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: true,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldMaxLength: 250,
                oldDefaultValue: "");

            migrationBuilder.AddColumn<DateTime>(
                name: "DateOfBirth",
                table: "Patient",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "District",
                table: "Patient",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "Gesttational",
                table: "Patient",
                type: "bit",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Institution",
                table: "Patient",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "PatientNumber",
                table: "Patient",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Province",
                table: "Patient",
                type: "nvarchar(50)",
                maxLength: 50,
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DateOfBirth",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "District",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Gesttational",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Institution",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "PatientNumber",
                table: "Patient");

            migrationBuilder.DropColumn(
                name: "Province",
                table: "Patient");

            migrationBuilder.AlterColumn<string>(
                name: "IdNumber",
                table: "UserProfile",
                type: "nvarchar(250)",
                maxLength: 250,
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "nvarchar(250)",
                oldMaxLength: 250,
                oldNullable: true,
                oldDefaultValue: "");
        }
    }
}
