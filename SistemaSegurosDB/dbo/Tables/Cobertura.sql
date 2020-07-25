CREATE TABLE [dbo].[Cobertura] (
    [ID_Cobertura]  INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]        VARCHAR (100) NOT NULL,
    [Descripcion]   VARCHAR (200) NOT NULL,
    [PrecioMensual] FLOAT (53)    NOT NULL,
    CONSTRAINT [PK_Cobertura] PRIMARY KEY CLUSTERED ([ID_Cobertura] ASC)
);

