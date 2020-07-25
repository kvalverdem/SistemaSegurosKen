CREATE TABLE [dbo].[CoberturaPorPolizaCliente] (
    [FK_IDPolizaPorCliente] INT NOT NULL,
    [FK_IDCobertura]        INT NOT NULL,
    [PorcentajeCobertura]   INT NOT NULL,
    CONSTRAINT [PK_CoberturaPorPolizaCliente] PRIMARY KEY CLUSTERED ([FK_IDPolizaPorCliente] ASC, [FK_IDCobertura] ASC),
    CONSTRAINT [FK_CoberturaPorPolizaCliente_Cobertura] FOREIGN KEY ([FK_IDCobertura]) REFERENCES [dbo].[Cobertura] ([ID_Cobertura]),
    CONSTRAINT [FK_CoberturaPorPolizaCliente_PolizaPorCliente] FOREIGN KEY ([FK_IDPolizaPorCliente]) REFERENCES [dbo].[PolizaPorCliente] ([ID_PolizaCliente])
);

