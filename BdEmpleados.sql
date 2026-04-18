-- Crear base de datos
CREATE DATABASE BdEmpleados;
GO

USE BdEmpleados;
GO

-- Crear tabla de tipos de empleados
CREATE TABLE TiposEmpleados (
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Nombre VARCHAR(500) NOT NULL,
    Activo BIT DEFAULT 1 NOT NULL,
    FechaAgrega DATETIME DEFAULT GETDATE() NOT NULL
);
GO

-- Crear tabla de empleados
CREATE TABLE Empleados(
    Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    TipoEmpleadoId INT NOT NULL,
    NombreCompleto VARCHAR(500) NOT NULL,
    NumeroIdentidad VARCHAR(20) NOT NULL,
    FechaNacimiento DATETIME NOT NULL,
    FechaContratacion DATETIME NOT NULL,
    Telefono VARCHAR(10) NOT NULL,
    Activo BIT DEFAULT 1 NOT NULL,
    FechaAgrega DATETIME DEFAULT GETDATE() NOT NULL,
    FOREIGN KEY (TipoEmpleadoId) REFERENCES TiposEmpleados(Id)
);
GO

-- Insertar datos de prueba
INSERT INTO TiposEmpleados(Nombre) VALUES ('Operador'), ('Gerente'), ('Analista');
GO

INSERT INTO Empleados(TipoEmpleadoId, NombreCompleto, NumeroIdentidad, FechaNacimiento, FechaContratacion, Telefono)
VALUES
(1, 'Xavier Alcerro', '0801200300123', '1995-05-15', '2020-01-10', '98765432'),
(2, 'Maria Gonzalez', '0801199900456', '1990-08-20', '2019-06-15', '99887766'),
(3, 'Carlos Rodriguez', '0802198800789', '1988-03-10', '2018-11-01', '96543210');
GO

-- Verificar datos
SELECT * FROM TiposEmpleados;
SELECT * FROM Empleados;
GO