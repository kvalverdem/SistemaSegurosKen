CREATE TABLE [dbo].[Cliente] (
    [Identificacion]  VARCHAR (25)  NOT NULL,
    [Nombre]          VARCHAR (50)  NOT NULL,
    [Apellidos]       VARCHAR (100) NOT NULL,
    [FechaNacimiento] DATETIME      NOT NULL,
    [Direccion]       VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED ([Identificacion] ASC)
);

