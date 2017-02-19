SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Steve Shortt
-- Create date: 18 Feb 2017
-- Description:	Plan Select
-- =============================================
ALTER PROCEDURE [synps].[api_plan_sel]
	@PlanUId uniqueidentifier
	,@Name varchar(250)
	,@UniqueName varchar(250)
	,@IsActive bit
	,@PlanFile varchar(max)
	,@PlanFileIsUri bit = 0
	,@PlanContainerUId uniqueidentifier
	,@AuditCreatedBy varchar(50)
	,@AuditCreatedTime datetime
	,@AuditModifiedBy varchar(50)
	,@AuditModifiedTime datetime
AS
BEGIN

SELECT [PlanUId]
      ,[Name]
      ,[Description]
      ,[UniqueName]
	  ,[IsActive]
      ,[PlanFile]
      ,[PlanFileIsUri]
      ,[PlanContainerUId]
  FROM [synps].[Plan]
  WHERE
		[PlanUId] = COALESCE(@PlanUId,[PlanUId])
		AND [Name] = COALESCE(@Name,[Name])
		AND [UniqueName] = COALESCE(@UniqueName,[UniqueName])
		AND [IsActive] = COALESCE(@IsActive,[IsActive])
		AND [PlanFile] = COALESCE(@PlanFile,[PlanFile])
		AND [PlanFileIsUri] = COALESCE(@PlanFileIsUri,[PlanFileIsUri])
		AND [PlanContainerUId] = COALESCE(@PlanContainerUId,[PlanContainerUId])
		AND [AuditCreatedBy] = COALESCE(@AuditCreatedBy,[AuditCreatedBy])
		AND [AuditCreatedTime] = COALESCE(@AuditCreatedTime,[AuditCreatedTime])
		AND [AuditModifiedBy] = COALESCE(@AuditModifiedBy,[AuditModifiedBy])
		AND [AuditModifiedTime] = COALESCE(@AuditModifiedTime,[AuditModifiedTime])

END