SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Steve Shortt
-- Create date: 18 Feb 2017
-- Description:	Plan Update
-- =============================================
ALTER PROCEDURE [synps].[api_plan_dml_upd]
	@PlanUId uniqueidentifier
	,@Name varchar(250)
	,@Description varchar(500) = null
	,@UniqueName varchar(250)
	,@IsActive bit
	,@PlanFile varchar(max)
	,@PlanFileIsUri bit = 0
	,@PlanContainerUId uniqueidentifier
	,@AuditModifiedBy varchar(50)
AS
BEGIN

	UPDATE [synps].[Plan]
	   SET [PlanUId] = @PlanUId
		  ,[Name] = @Name
		  ,[Description] = @Description
		  ,[UniqueName] = @UniqueName
		  ,[IsActive] = @IsActive
		  ,[PlanFile] = @PlanFile
		  ,[PlanFileIsUri] = @PlanFileIsUri
		  ,[PlanContainerUId] = @PlanContainerUId
		  ,[AuditModifiedBy] = @AuditModifiedBy
		  ,[AuditModifiedTime] = GETDATE()
	   WHERE [PlanUId] = @PlanUId

END