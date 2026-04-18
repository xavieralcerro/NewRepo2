using _20221930056_XavierAlcerro_WebApi.Data;
using _20221930056_XavierAlcerro_WebApi.Repositories;
using _20221930056_XavierAlcerro_WebApi.Services.AppServices;
using _20221930056_XavierAlcerro_WebApi.Services.DomainServices;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi;
using Microsoft.OpenApi.Models;
using TuNombreProyecto.Services.AppServices;
using TuNombreProyecto.Services.DomainServices;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();

// Configurar Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "API de Gestión de Empleados - Xavier Alcerro",
        Version = "v1",
        Description = "Sistema de gestión de empleados para Open AI"
    });
});

// Configurar DbContext con SQL Server
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Registrar Repositories
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));

// Registrar Domain Services
builder.Services.AddScoped<IEmployeeTypeDomainService, EmployeeTypeDomainService>();
builder.Services.AddScoped<IEmployeeDomainService, EmployeeDomainService>();

// Registrar App Services
builder.Services.AddScoped<IEmployeeTypeAppService, EmployeeTypeAppService>();
builder.Services.AddScoped<IEmployeeAppService, EmployeeAppService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseAuthorization();
app.MapControllers();

app.Run();