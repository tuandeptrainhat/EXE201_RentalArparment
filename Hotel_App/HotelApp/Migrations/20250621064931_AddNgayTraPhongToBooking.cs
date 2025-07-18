using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HotelApp.Migrations
{
    /// <inheritdoc />
    public partial class AddNgayTraPhongToBooking : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "3f9a0c96-f4c8-4ea1-a4de-d05adfd6454b");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "e97c8d11-efae-4c17-93b8-59376e9cb0a0");

            migrationBuilder.AddColumn<DateTime>(
                name: "ngaytraphong",
                table: "Bookings",
                type: "datetime2",
                nullable: true);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "264a1226-62fc-4812-ac21-821e387a4ff1", null, "Client", "CLIENT" },
                    { "f9212cec-2404-48e4-8134-28fb50f59305", null, "Admin", "ADMIN" }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "264a1226-62fc-4812-ac21-821e387a4ff1");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "f9212cec-2404-48e4-8134-28fb50f59305");

            migrationBuilder.DropColumn(
                name: "ngaytraphong",
                table: "Bookings");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "3f9a0c96-f4c8-4ea1-a4de-d05adfd6454b", null, "Client", "CLIENT" },
                    { "e97c8d11-efae-4c17-93b8-59376e9cb0a0", null, "Admin", "ADMIN" }
                });
        }
    }
}
