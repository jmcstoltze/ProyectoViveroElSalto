USE El_Salto
GO

-- Vista para consultar todos los datos de las tablas
CREATE VIEW VwGetPlantas AS
	SELECT * FROM El_Salto.dbo.Planta
GO

CREATE VIEW VwGetLogin AS
	SELECT * FROM El_Salto.dbo.Login
GO

-- Procedimiento para insertar una nueva planta en la tabla
CREATE PROCEDURE spPlantaSave
    @NombreComun VARCHAR(255),
	@NombreCientifico VARCHAR(255),
	@TipoPlanta VARCHAR(255),
	@Descripcion VARCHAR(255),
    @TiempoRiego INT,
	@CantidadAgua INT,
	@Epoca VARCHAR(15),
    @EsVenenosa BIT,
	@EsAutoctona BIT
AS
BEGIN
    INSERT INTO El_Salto.dbo.Planta (NombreComun, NombreCientifico, TipoPlanta, Descripcion, TiempoRiego, CantidadAgua, Epoca, EsVenenosa, EsAutoctona)
    VALUES (@NombreComun, @NombreCientifico, @TipoPlanta, @Descripcion, @TiempoRiego, @CantidadAgua, @Epoca, @EsVenenosa, @EsAutoctona);
END
GO

-- Procedimiento para actualizar una planta en la tabla según Id
CREATE PROCEDURE spPlantaUpdateById
    @Id INT,
    @NombreComun VARCHAR(255),
	@NombreCientifico VARCHAR(255),
	@TipoPlanta VARCHAR(255),
	@Descripcion VARCHAR(255),
    @TiempoRiego INT,
	@CantidadAgua INT,
    @Epoca VARCHAR(15),       
    @EsVenenosa BIT,
	@EsAutoctona BIT
AS
BEGIN
    UPDATE El_Salto.dbo.Planta
    SET NombreComun = @NombreComun,
		NombreCientifico = @NombreCientifico,
		TipoPlanta = @TipoPlanta,
		Descripcion = @Descripcion,
		TiempoRiego = @TiempoRiego,
		CantidadAgua = @CantidadAgua,
		Epoca = @Epoca,
		EsVenenosa = @EsVenenosa,
		EsAutoctona = @EsAutoctona        
    WHERE Id = @Id;
END
GO

-- Procedimiento para eliminar una planta de la tabla según Id
CREATE PROCEDURE spPlantaDeleteById
    @Id INT
AS
BEGIN
    DELETE FROM El_Salto.dbo.Planta
    WHERE Id = @Id;
END
GO

-----

USE El_Salto
GO

-- Procedimiento para leer contraseñas de usuarios
CREATE PROCEDURE spLogin
	@Username varchar(255)
AS
	SELECT PASSWORD FROM El_Salto.dbo.Login WHERE Username = @Username
GO

CREATE PROCEDURE spCreateUser
	@Username varchar(255),
	@Password varchar(255)
AS
	INSERT INTO El_Salto.dbo.Login (Username, Password) VALUES (@Username, @Password)
GO

/*
declare @user varchar(255) = 'Administrador'
declare @pass varchar(255) = 'uUWaCI3ScZ6IzyWLXdoIIdUkWr1/1fjrwiYaDoPUQ7SJ5hPj'
/*pass es 123456*/
exec spCreateUser @user, @pass
go*/

select * from users
go
