using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class AddNumberOfParticipantsToTrainingSession : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "LastUpdated",
                table: "Sale");

            migrationBuilder.DropColumn(
                name: "UpdatedBy",
                table: "Sale");

            migrationBuilder.AddColumn<int>(
                name: "NumberOfParticipants",
                table: "TrainingSession",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NumberOfParticipants",
                table: "TrainingSession");

            migrationBuilder.AddColumn<DateTime>(
                name: "LastUpdated",
                table: "Sale",
                type: "datetime",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UpdatedBy",
                table: "Sale",
                type: "int",
                nullable: true);
        }
    }
}
