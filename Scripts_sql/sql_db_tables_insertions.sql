USE master
GO
DROP DATABASE El_Salto;

CREATE DATABASE El_Salto
GO

USE El_Salto
GO

CREATE TABLE Login(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Username VARCHAR(25) UNIQUE NOT NULL,
	Password VARCHAR(255) NOT NULL
)
GO

DELETE FROM El_Salto.dbo.Login;

USE El_Salto
GO

INSERT INTO LOGIN (Username, Password) VALUES ('Administrador', 'uUWaCI3ScZ6IzyWLXdoIIdUkWr1/1fjrwiYaDoPUQ7SJ5hPj')
GO

-- Conjunto de sentencias para generar dos usuarios con contrase�as
DECLARE @Salt VARCHAR(255);
SET @Salt = CONVERT(VARCHAR(255), NEWID());
SELECT @Salt AS Salt;

-- Salt para encriptaci�n ---------> '6A1A5E22-9F6D-41E8-AE37-1CD3D4A6E6BF';

-- Generaci�n de hashes para las nuevas contrase�as
DECLARE @HashedPasswordUser1 VARCHAR(255);
DECLARE @HashedPasswordUser2 VARCHAR(255);

SET @HashedPasswordUser1 = CONVERT(VARCHAR(255), HASHBYTES('SHA2_512', @Salt + '111111'), 2);
SET @HashedPasswordUser2 = CONVERT(VARCHAR(255), HASHBYTES('SHA2_512', @Salt + '222222'), 2);

-- Inserci�n de las contrase�as para User1 y User2 en la tabla Login
INSERT INTO El_Salto.dbo.Login (Username, Password) 
VALUES 
    ('User1', @HashedPasswordUser1),
    ('User2', @HashedPasswordUser2);


USE El_Salto
GO

CREATE TABLE Planta(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	NombreComun VARCHAR(255) UNIQUE NOT NULL,
	NombreCientifico VARCHAR(255) UNIQUE NOT NULL,
	TipoPlanta VARCHAR(255) NOT NULL,
	Descripcion VARCHAR(255),
	TiempoRiego INT NOT NULL,
	CantidadAgua INT NOT NULL,
	Epoca VARCHAR(15) NOT NULL,
	EsVenenosa BIT,
	EsAutoctona BIT
)
GO

SELECT * FROM El_Salto.dbo.Planta;
SELECT * FROM El_Salto.dbo.Login;

USE El_Salto;
GO
DELETE FROM dbo.Planta;
GO
DBCC CHECKIDENT ('El_Salto.dbo.Planta', RESEED, 0);
GO



DELETE FROM El_Salto.dbo.Planta;

INSERT INTO El_Salto.dbo.Planta (NombreComun, NombreCientifico, TipoPlanta, Descripcion, TiempoRiego, CantidadAgua, Epoca, EsVenenosa, EsAutoctona)
VALUES 
('Rosa', 'Rosa spp.', 'Arbusto', 'Planta ornamental con flores de diversos colores.', 3, 500, 'Primavera', 0, 0),
('Cactus', 'Cactaceae', 'Matorral', 'Planta adaptada a ambientes secos, con espinas en lugar de hojas.', 14, 200, 'Verano', 0, 0),
('Lavanda', 'Lavandula', 'Herb�cea', 'Planta arom�tica utilizada en perfumer�a y cocina.', 7, 300, 'Verano', 0, 0),
('Hiedra', 'Hedera helix', 'Arbusto', 'Planta trepadora com�nmente utilizada como cobertura de muros.', 4, 400, 'Oto�o', 0, 0),
('Narciso', 'Narcissus', 'Herb�cea', 'Planta con flores amarillas que florecen en primavera.', 5, 350, 'Primavera', 0, 0),
('Digitalis', 'Digitalis purpurea', 'Herb�cea', 'Planta conocida por sus flores en forma de campana, es t�xica si se ingiere.', 3, 500, 'Verano', 1, 0),
('Eucalipto', 'Eucalyptus', '�rbol', '�rbol de r�pido crecimiento conocido por sus propiedades medicinales.', 7, 1000, 'Invierno', 0, 0),
('Albahaca', 'Ocimum basilicum', 'Herb�cea', 'Planta arom�tica usada com�nmente en la cocina mediterr�nea.', 2, 200, 'Verano', 0, 0),
('Acebo', 'Ilex aquifolium', 'Arbusto', 'Arbusto ornamental con bayas rojas, es t�xico si se ingiere.', 10, 800, 'Invierno', 1, 0),
('Poto', 'Epipremnum aureum', 'Arbusto', 'Planta trepadora popular en interiores, f�cil de cuidar.', 6, 250, 'Oto�o', 0, 0),
('Roble', 'Quercus robur', '�rbol', '�rbol robusto y longevo, s�mbolo de fuerza y resistencia.', 14, 1500, 'Oto�o', 0, 1),
('Tomillo', 'Thymus vulgaris', 'Herb�cea', 'Planta arom�tica utilizada en cocina y medicina.', 4, 150, 'Verano', 0, 0),
('Adelfa', 'Nerium oleander', 'Arbusto', 'Arbusto ornamental con flores vistosas, es altamente venenosa.', 7, 500, 'Verano', 1, 0),
('Orqu�dea', 'Orchidaceae', 'Herb�cea', 'Planta con flores ex�ticas y vistosas, requiere cuidados especiales.', 5, 300, 'Primavera', 0, 0),
('Sauce', 'Salix babylonica', '�rbol', '�rbol de r�pido crecimiento con ramas colgantes, se encuentra cerca de cuerpos de agua.', 10, 1200, 'Primavera', 0, 1),
('Girasol', 'Helianthus annuus', 'Herb�cea', 'Planta anual con grandes flores amarillas que siguen el sol.', 9, 500, 'Verano', 0, 0),
('Manzanilla', 'Matricaria chamomilla', 'Herb�cea', 'Planta utilizada en infusiones por sus propiedades calmantes.', 2, 100, 'Primavera', 0, 0),
('Abeto', 'Abies alba', '�rbol', '�rbol con�fero com�n en regiones monta�osas, utilizado en Navidad.', 20, 2000, 'Invierno', 0, 1),
('Helecho', 'Pteridium aquilinum', 'Herb�cea', 'Planta sin flores que se reproduce por esporas.', 5, 400, 'Primavera', 0, 0),
('Jazm�n', 'Jasminum', 'Arbusto', 'Planta trepadora con flores blancas muy arom�ticas.', 4, 300, 'Verano', 0, 0),
('Bamb�', 'Bambusoideae', 'Hierba', 'Planta de r�pido crecimiento usada en construcci�n y decoraci�n.', 15, 1000, 'Verano', 0, 0),
('Cilantro', 'Coriandrum sativum', 'Herb�cea', 'Planta arom�tica utilizada en cocina, especialmente en la cocina mexicana.', 1, 50, 'Verano', 0, 0),
('Peon�a', 'Paeonia', 'Herb�cea', 'Planta con grandes flores vistosas, popular en jardines.', 6, 600, 'Primavera', 0, 0),
('Menta', 'Mentha', 'Herb�cea', 'Planta arom�tica usada en infusiones y cocina.', 2, 150, 'Verano', 0, 0),
('Secuoya', 'Sequoia sempervirens', '�rbol', '�rbol gigante y longevo, nativo de la costa oeste de Estados Unidos.', 50, 3000, 'Invierno', 0, 1),
('Begonia', 'Begonia', 'Herb�cea', 'Planta ornamental con flores de colores brillantes, ideal para interiores.', 3, 200, 'Verano', 0, 0),
('Romero', 'Rosmarinus officinalis', 'Herb�cea', 'Planta arom�tica usada en cocina y medicina, conocida por su fragancia.', 4, 350, 'Verano', 0, 0),
('Glicinia', 'Wisteria', 'Arbusto', 'Planta trepadora con racimos de flores colgantes, usualmente violetas.', 7, 700, 'Primavera', 0, 0),
('Dalia', 'Dahlia', 'Herb�cea', 'Planta con flores grandes y vistosas de diversos colores.', 5, 400, 'Verano', 0, 0),
('Nogal', 'Juglans regia', '�rbol', '�rbol frutal conocido por sus nueces comestibles.', 25, 1500, 'Oto�o', 0, 1),
('R�bano', 'Raphanus sativus', 'Herb�cea', 'Planta comestible cultivada por sus ra�ces, que se utilizan en ensaladas.', 1, 100, 'Primavera', 0, 0),
('Tulip�n', 'Tulipa', 'Herb�cea', 'Planta bulbosa con flores de diversos colores, muy popular en jardines.', 3, 300, 'Primavera', 0, 0),
('Serbal', 'Sorbus aucuparia', '�rbol', '�rbol con frutos rojos comestibles, conocido por su resistencia al fr�o.', 8, 800, 'Oto�o', 0, 1),
('Arce', 'Acer', '�rbol', '�rbol ornamental conocido por su follaje colorido en oto�o.', 12, 1000, 'Oto�o', 0, 1),
('Cal�ndula', 'Calendula officinalis', 'Herb�cea', 'Planta con flores naranjas o amarillas, usada en medicina tradicional.', 3, 200, 'Verano', 0, 0);
GO

UPDATE El_Salto.dbo.Planta SET EsVenenosa =1 , EsAutoctona =1 WHERE Id IN (16,21,22,23);

