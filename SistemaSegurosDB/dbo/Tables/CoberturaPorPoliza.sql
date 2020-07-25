CREATE TABLE [dbo].[CoberturaPorPoliza] (
    [FK_Poliza]    INT NOT NULL,
    [FK_Cobertura] INT NOT NULL,
    CONSTRAINT [PK_CoberturaPorPoliza] PRIMARY KEY CLUSTERED ([FK_Poliza] ASC, [FK_Cobertura] ASC),
    CONSTRAINT [FK_CoberturaPorPoliza_Cobertura] FOREIGN KEY ([FK_Cobertura]) REFERENCES [dbo].[Cobertura] ([ID_Cobertura]),
    CONSTRAINT [FK_CoberturaPorPoliza_Poliza] FOREIGN KEY ([FK_Poliza]) REFERENCES [dbo].[Poliza] ([ID_Poliza])
);

