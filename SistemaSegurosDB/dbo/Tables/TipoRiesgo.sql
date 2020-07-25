CREATE TABLE [dbo].[TipoRiesgo] (
    [ID_Riesgo] INT          IDENTITY (1, 1) NOT NULL,
    [Nombre]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_TipoRiesgo] PRIMARY KEY CLUSTERED ([ID_Riesgo] ASC)
);

