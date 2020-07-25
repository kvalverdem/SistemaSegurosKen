CREATE TABLE [dbo].[Poliza] (
    [ID_Poliza]     INT           IDENTITY (1, 1) NOT NULL,
    [Nombre]        VARCHAR (100) NOT NULL,
    [Descripcion]   VARCHAR (250) NOT NULL,
    [FK_TipoRiesgo] INT           NOT NULL,
    CONSTRAINT [PK_Poliza] PRIMARY KEY CLUSTERED ([ID_Poliza] ASC),
    CONSTRAINT [FK_Poliza_TipoRiesgo] FOREIGN KEY ([FK_TipoRiesgo]) REFERENCES [dbo].[TipoRiesgo] ([ID_Riesgo])
);

