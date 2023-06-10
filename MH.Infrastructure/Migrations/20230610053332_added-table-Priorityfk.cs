using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MH.Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class addedtablePriorityfk : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails",
                column: "PriorityId",
                unique: true);

            migrationBuilder.AddForeignKey(
                name: "FK_TicketDetails_Priority_PriorityId",
                table: "TicketDetails",
                column: "PriorityId",
                principalTable: "Priority",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_TicketDetails_Priority_PriorityId",
                table: "TicketDetails");

            migrationBuilder.DropIndex(
                name: "IX_TicketDetails_PriorityId",
                table: "TicketDetails");
        }
    }
}
