﻿/****** Script for SelectTopNRows command from SSMS  ******/
/*
Here I am alterying the table [DOC_C2P_2010_2018_VW] 
1. to add the new columns, [O_Cty], [D_Cty], [O_Port], and [D_Port]. 
2. I am populating the [Direction] column with the value "Import",populating the [D_Cty] column with the value "US", and populating the [D_Reg] column with the value "NA". 
3. I am selecting data from the table [DOC_C2P_2010_2018_VW] along with additional data from a lookup table in the database [Country Code Lookup] to map country codes to theri corresponding country names and regions. 
4. I am applying outerapply to join the [Country Code Lookup] table twice, once for origin country and once for destination country, to map country does to country names and regions. 
5. I am selecting the necessary columns from both the original table and the joined [Country Code Lookup] table and inserting them into a new table that I am calling [DOC_C2P_2010_2018_VW_Cty_Mapped]
*/



SELECT [Direction]
      ,[C2C_Lane]
      ,[C2P_Lane]
      ,[O_Cty]
      ,[D_Cty]
      ,[O_Port]
      ,[D_Port]
      ,[commodity]
      ,[port_code]
      ,SUM([W2010]) AS [W2010]
      ,SUM([W2011]) AS [W2011]
      ,SUM([W2012]) AS [W2012]
      ,SUM([W2013]) AS [W2013]
      ,SUM([W2014]) AS [W2014]
      ,SUM([W2015]) AS [W2015]
      ,SUM([W2016]) AS [W2016]
      ,SUM([W2017]) AS [W2017]
      ,SUM([W2018]) AS [W2018]
  FROM [Tradecube 3.0 Processed Files].[dbo].[DOC_C2P_2010_2018_VW]
  WHERE [mode] = 'Air' AND ([commodity] = '080920' OR [commodity] = '080929' OR [commodity] = '080921')
  GROUP BY [Direction]
      ,[C2C_Lane]
      ,[C2P_Lane]
      ,[O_Cty]
      ,[D_Cty]
      ,[O_Port]
      ,[D_Port]
      ,[commodity]
      ,[port_code]
