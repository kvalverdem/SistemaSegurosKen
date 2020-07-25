CREATE TABLE [dbo].[PolizaPorCliente] (
    [ID_PolizaCliente]      INT          IDENTITY (1, 1) NOT NULL,
    [FK_IDCliente]          VARCHAR (25) NOT NULL,
    [FK_IDPoliza]           INT          NOT NULL,
    [InicioVigenciaPoliza]  DATETIME     NOT NULL,
    [PrecioPolizaAdquirida] FLOAT (53)   NOT NULL,
    [MesesCobertura]        INT          NOT NULL,
    [Estado]                INT          NOT NULL,
    CONSTRAINT [PK_PolizaPorCliente] PRIMARY KEY CLUSTERED ([ID_PolizaCliente] ASC),
    CONSTRAINT [FK_PolizaPorCliente_Cliente] FOREIGN KEY ([FK_IDCliente]) REFERENCES [dbo].[Cliente] ([Identificacion]),
    CONSTRAINT [FK_PolizaPorCliente_Poliza] FOREIGN KEY ([FK_IDPoliza]) REFERENCES [dbo].[Poliza] ([ID_Poliza])
);

