using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addedtableTicketStatus1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails");

            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails",
                column: "PriorityId");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails",
                column: "StatusId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails");

            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails");

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails",
                column: "PriorityId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_StatusId",
                table: "TicketDetails",
                column: "StatusId",
                unique: true);
        }
    }
}
