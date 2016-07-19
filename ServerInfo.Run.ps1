﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: e2a90940-58eb-49e2-b723-f42df5953d0a
# Source File: D:\Projects\ServerInfo.psf
#------------------------------------------------------------------------

<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2016 v5.2.124
     Generated on:       7/19/2016 12:06 AM
     Generated by:       carol
    --------------------------------------------------------------------------------
    .DESCRIPTION
        GUI script generated by PowerShell Studio 2016
#>
#----------------------------------------------
#region Application Functions
#----------------------------------------------

function OnApplicationExit
{
	#NOTE:  This funciton is not called in Projects
	#NOTE: This funciton runs after the form is closed
	#TODO:  Add custom code to clean up and unlaod snapins when the application exits
	
	$script:ExitCode = 0 #Set the exit code for the packager
}

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Call-ServerInfo_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formServerInfo = New-Object 'System.Windows.Forms.Form'
	$datagridview1 = New-Object 'System.Windows.Forms.DataGridView'
	$buttonShares2 = New-Object 'System.Windows.Forms.Button'
	$buttonProcesses2 = New-Object 'System.Windows.Forms.Button'
	$buttonServices2 = New-Object 'System.Windows.Forms.Button'
	$buttonGetEvent2 = New-Object 'System.Windows.Forms.Button'
	$lblTitle = New-Object 'System.Windows.Forms.Label'
	$buttonMemoryUtilization = New-Object 'System.Windows.Forms.Button'
	$buttonCPUUtilization = New-Object 'System.Windows.Forms.Button'
	$buttonShares = New-Object 'System.Windows.Forms.Button'
	$buttonProcesses = New-Object 'System.Windows.Forms.Button'
	$buttonServices = New-Object 'System.Windows.Forms.Button'
	$buttonGetEventLog = New-Object 'System.Windows.Forms.Button'
	$buttonRemoteSessions = New-Object 'System.Windows.Forms.Button'
	$textboxUsername = New-Object 'System.Windows.Forms.TextBox'
	$labelEnterLoginID = New-Object 'System.Windows.Forms.Label'
	$labelEnterServer = New-Object 'System.Windows.Forms.Label'
	$txtBoxServerName = New-Object 'System.Windows.Forms.TextBox'
	$btnLoginID = New-Object 'System.Windows.Forms.Button'
	$btnServer = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	#----------------------------------------------
	function Main
	{
		Param ([String]$Commandline)
		#Note: This function runs before the form is created
		#Note: To get the script directory inteh Packager user: Split-path $hostinvocation.MyCommand.path
		#Note: To get the console output in the Packager (Windows Mode) use: $ConsoleOutput (Type: System.Collections.ArrayList)
		#Important: Form Controls cannot be asccessed in this function
		#TODO: Add snapins and custom code to validate the applicatin load
		
		return $true #return true for success or false for failure
	}
	
	function OnApplicationExit
	{
		#NOTE:  This funciton is not called in Projects
		#NOTE: This funciton runs after the form is closed
		#TODO:  Add custom code to clean up and unlaod snapins when the application exits
		
		$script:ExitCode = 0 #Set the exit code for the packager
	}
	
	
	$formServerInfo_Load={
		#TODO: Initalize Form Controls Here
		
	}
	
	$buttonLoginID_Click = {
		$global:cred = Get-Credential -Credential $textboxUsername.Text
		
	}
	
	$buttonRemoteSessions_Click={
		$queryResults = (qwinsta /server:$ServerName)
	}
	
	$buttonServices_Click= {
		#Get-Service -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server,Name | Out-GridView
		Get-Service | Out-GridView
		
	}
	
	$buttonServices2_Click = {
		#$services = Get-Service -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server,Name 
		$services = Get-Service
		Load-DataGridView -DataGridView $datagridview1 -Item $Services
	}
	
	$buttonProcesses_Click={
		#get-process -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server, Name | Out-GridView
		get-process  | Out-GridView
	}
	
	$buttonProcesses2_Click = {
		#$processes = get-process -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server, Name | Out-GridView
		$processes = get-process
		Load-DataGridView -DataGridView $datagridview1 -Item $processes
	}
	$buttonShares_Click={
			#Get-WmiObject Win32_Share -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server, Name | Out-GridView
		    Get-WmiObject Win32_Share | Out-GridView
	}
	
	$buttonShares2_Click = {
		#Get-WmiObject Win32_Share -ComputerName $txtBoxServerName.Text -Credential $cred | Select-Object Server, Name | Out-GridView
		$shares = Get-WmiObject Win32_Share 
		Load-DataGridView -DataGridView $datagridview1 -Item $shares
	}
	
	
	$buttonGetEventLog_Click={
		Get-EventLog | Out-GridView
		#Get-Event -ComputerName $txtBoxServerName.Text -Credential $cred | Out-GridView
	}
	
	$buttonEventLog2_Click = {
		$eventlog = Get-EventLog -LogName System
		Load-DataGridView -DataGridView $datagridview1 -Item $eventlog
		}
	$buttonCPUUtilization_Click = {
		#TODO: Place custom script here
		(Get-WmiObject Win32_PerfFormattedData_PerfOS_Processor -filter "Name='_Total'").PercentProcessorTime | Out-GridView
		#$CPUusage = (Get-WmiObject Win32_PerfFormattedData_PerfOS_Processor -filter "Name='_Total'").PercentProcessorTime
		#Load-DataGridView -DataGridView $datagridview1 -Item $CPUusage
	}
	#region Control Helper Function
	function Load-DataGridView
	{
		<#
		.SYNOPSIS
		  This function help you load items into a DataGridView
		
		.DESCRIPTION
		  Use this function to dynamically olaod items into the DataGridView control.
		
		.PARAMETER DataGridView
		  The combobox control you want to add items to.
		
		.PARAMETER Item
		  The object or objects you wish to load into the ComboBox's items collection.
		
		.PARAMATER DataMember
		  Sets the name of hte list or table in teh data source for which the DataGridView is displaying data.
		
		#>
		param (
			[ValidateNotNull()]
			[Parameter(Mandatory = $true)]
			[System.Windows.Forms.DataGridView]$DataGridView,
			[ValidateNotNull()]
			[Parameter(Mandatory = $true)]
			$Item,
			[Parameter(Mandatory = $false)]
			[string]$DataMember
		)
		$DataGridView.SuspendLayout()
		$DataGridView.DataMember = $DataMember
		
		IF ($Item -is [System.ComponentModel.IListSource]`
			-or $Item -is [System.ComponentModel.IBindingList] -or $Item -is [System.ComponentModel.IBindingListView] )
	   {
		   $DataGridView.DataSource = $Item
	   }
	   else
	   {
		$array = New-Object System.Collections.ArrayList
		
		if ($Item -is [System.Collections.IList])
		{
			$array.AddRange($Item)
		}
		else
		{
			$array.Add($Item)
		}
		$DataGridView.DataSource = $array
	  }
	  $DataGridView.ResumeLayout()
	}
	#end Region
	
	
	
	#region Control Helper Functions
	function ConvertTo-DataTable
	{
		<#
			.SYNOPSIS
				Converts objects into a DataTable.
		
			.DESCRIPTION
				Converts objects into a DataTable, which are used for DataBinding.
		
			.PARAMETER  InputObject
				The input to convert into a DataTable.
		
			.PARAMETER  Table
				The DataTable you wish to load the input into.
		
			.PARAMETER RetainColumns
				This switch tells the function to keep the DataTable's existing columns.
			
			.PARAMETER FilterWMIProperties
				This switch removes WMI properties that start with an underline.
		
			.EXAMPLE
				$DataTable = ConvertTo-DataTable -InputObject (Get-Process)
		#>
		[OutputType([System.Data.DataTable])]
		param(
		[ValidateNotNull()]
		$InputObject, 
		[ValidateNotNull()]
		[System.Data.DataTable]$Table,
		[switch]$RetainColumns,
		[switch]$FilterWMIProperties)
		
		if($Table -eq $null)
		{
			$Table = New-Object System.Data.DataTable
		}
	
		if($InputObject-is [System.Data.DataTable])
		{
			$Table = $InputObject
		}
		else
		{
			if(-not $RetainColumns -or $Table.Columns.Count -eq 0)
			{
				#Clear out the Table Contents
				$Table.Clear()
	
				if($InputObject -eq $null){ return } #Empty Data
				
				$object = $null
				#find the first non null value
				foreach($item in $InputObject)
				{
					if($item -ne $null)
					{
						$object = $item
						break	
					}
				}
	
				if($object -eq $null) { return } #All null then empty
				
				#Get all the properties in order to create the columns
				foreach ($prop in $object.PSObject.Get_Properties())
				{
					if(-not $FilterWMIProperties -or -not $prop.Name.StartsWith('__'))#filter out WMI properties
					{
						#Get the type from the Definition string
						$type = $null
						
						if($prop.Value -ne $null)
						{
							try{ $type = $prop.Value.GetType() } catch {}
						}
	
						if($type -ne $null) # -and [System.Type]::GetTypeCode($type) -ne 'Object')
						{
			      			[void]$table.Columns.Add($prop.Name, $type) 
						}
						else #Type info not found
						{ 
							[void]$table.Columns.Add($prop.Name) 	
						}
					}
			    }
				
				if($object -is [System.Data.DataRow])
				{
					foreach($item in $InputObject)
					{	
						$Table.Rows.Add($item)
					}
					return  @(,$Table)
				}
			}
			else
			{
				$Table.Rows.Clear()	
			}
			
			foreach($item in $InputObject)
			{		
				$row = $table.NewRow()
				
				if($item)
				{
					foreach ($prop in $item.PSObject.Get_Properties())
					{
						if($table.Columns.Contains($prop.Name))
						{
							$row.Item($prop.Name) = $prop.Value
						}
					}
				}
				[void]$table.Rows.Add($row)
			}
		}
	
		return @(,$Table)	
	}
	#endregion
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$formServerInfo.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonShares2.remove_Click($buttonShares2_Click)
			$buttonProcesses2.remove_Click($buttonProcesses2_Click)
			$buttonServices2.remove_Click($buttonServices2_Click)
			$buttonCPUUtilization.remove_Click($buttonCPUUtilization_Click)
			$buttonShares.remove_Click($buttonShares_Click)
			$buttonProcesses.remove_Click($buttonProcesses_Click)
			$buttonServices.remove_Click($buttonServices_Click)
			$buttonGetEventLog.remove_Click($buttonGetEventLog_Click)
			$buttonRemoteSessions.remove_Click($buttonRemoteSessions_Click)
			$formServerInfo.remove_Load($formServerInfo_Load)
			$formServerInfo.remove_Load($Form_StateCorrection_Load)
			$formServerInfo.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch [Exception]
		{ }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$formServerInfo.SuspendLayout()
	#
	# formServerInfo
	#
	$formServerInfo.Controls.Add($datagridview1)
	$formServerInfo.Controls.Add($buttonShares2)
	$formServerInfo.Controls.Add($buttonProcesses2)
	$formServerInfo.Controls.Add($buttonServices2)
	$formServerInfo.Controls.Add($buttonGetEvent2)
	$formServerInfo.Controls.Add($lblTitle)
	$formServerInfo.Controls.Add($buttonMemoryUtilization)
	$formServerInfo.Controls.Add($buttonCPUUtilization)
	$formServerInfo.Controls.Add($buttonShares)
	$formServerInfo.Controls.Add($buttonProcesses)
	$formServerInfo.Controls.Add($buttonServices)
	$formServerInfo.Controls.Add($buttonGetEventLog)
	$formServerInfo.Controls.Add($buttonRemoteSessions)
	$formServerInfo.Controls.Add($textboxUsername)
	$formServerInfo.Controls.Add($labelEnterLoginID)
	$formServerInfo.Controls.Add($labelEnterServer)
	$formServerInfo.Controls.Add($txtBoxServerName)
	$formServerInfo.Controls.Add($btnLoginID)
	$formServerInfo.Controls.Add($btnServer)
	$formServerInfo.AutoScaleDimensions = '6, 13'
	$formServerInfo.AutoScaleMode = 'Font'
	$formServerInfo.ClientSize = '670, 574'
	$formServerInfo.Name = 'formServerInfo'
	$formServerInfo.Text = 'ServerInfo'
	$formServerInfo.add_Load($formServerInfo_Load)
	#
	# datagridview1
	#
	$datagridview1.ColumnHeadersHeightSizeMode = 'AutoSize'
	$datagridview1.Location = '12, 234'
	$datagridview1.Name = 'datagridview1'
	$datagridview1.Size = '646, 328'
	$datagridview1.TabIndex = 21
	#
	# buttonShares2
	#
	$buttonShares2.Location = '138, 118'
	$buttonShares2.Name = 'buttonShares2'
	$buttonShares2.Size = '120, 30'
	$buttonShares2.TabIndex = 20
	$buttonShares2.Text = 'Shares'
	$buttonShares2.UseVisualStyleBackColor = $True
	$buttonShares2.add_Click($buttonShares2_Click)
	#
	# buttonProcesses2
	#
	$buttonProcesses2.Location = '138, 84'
	$buttonProcesses2.Name = 'buttonProcesses2'
	$buttonProcesses2.Size = '120, 28'
	$buttonProcesses2.TabIndex = 19
	$buttonProcesses2.Text = 'Processes'
	$buttonProcesses2.UseVisualStyleBackColor = $True
	$buttonProcesses2.add_Click($buttonProcesses2_Click)
	#
	# buttonServices2
	#
	$buttonServices2.Location = '138, 49'
	$buttonServices2.Name = 'buttonServices2'
	$buttonServices2.Size = '120, 29'
	$buttonServices2.TabIndex = 18
	$buttonServices2.Text = 'Services'
	$buttonServices2.UseVisualStyleBackColor = $True
	$buttonServices2.add_Click($buttonServices2_Click)
	#
	# buttonGetEvent2
	#
	$buttonGetEvent2.Location = '138, 13'
	$buttonGetEvent2.Name = 'buttonGetEvent2'
	$buttonGetEvent2.Size = '120, 29'
	$buttonGetEvent2.TabIndex = 17
	$buttonGetEvent2.Text = 'Get Event Log'
	$buttonGetEvent2.UseVisualStyleBackColor = $True
	#
	# lblTitle
	#
	$lblTitle.AutoSize = $True
	$lblTitle.Font = 'Microsoft Sans Serif, 14pt'
	$lblTitle.Location = '317, 13'
	$lblTitle.Name = 'lblTitle'
	$lblTitle.Size = '257, 24'
	$lblTitle.TabIndex = 15
	$lblTitle.Text = 'Remote Admin Tool Assistant'
	#
	# buttonMemoryUtilization
	#
	$buttonMemoryUtilization.Location = '12, 154'
	$buttonMemoryUtilization.Name = 'buttonMemoryUtilization'
	$buttonMemoryUtilization.Size = '120, 30'
	$buttonMemoryUtilization.TabIndex = 14
	$buttonMemoryUtilization.Text = 'Memory Utilization'
	$buttonMemoryUtilization.UseVisualStyleBackColor = $True
	#
	# buttonCPUUtilization
	#
	$buttonCPUUtilization.Location = '138, 154'
	$buttonCPUUtilization.Name = 'buttonCPUUtilization'
	$buttonCPUUtilization.Size = '120, 30'
	$buttonCPUUtilization.TabIndex = 13
	$buttonCPUUtilization.Text = 'CPU Utilization'
	$buttonCPUUtilization.UseVisualStyleBackColor = $True
	$buttonCPUUtilization.add_Click($buttonCPUUtilization_Click)
	#
	# buttonShares
	#
	$buttonShares.Location = '12, 118'
	$buttonShares.Name = 'buttonShares'
	$buttonShares.Size = '120, 30'
	$buttonShares.TabIndex = 12
	$buttonShares.Text = 'Shares'
	$buttonShares.UseVisualStyleBackColor = $True
	$buttonShares.add_Click($buttonShares_Click)
	#
	# buttonProcesses
	#
	$buttonProcesses.Location = '12, 84'
	$buttonProcesses.Name = 'buttonProcesses'
	$buttonProcesses.Size = '120, 28'
	$buttonProcesses.TabIndex = 11
	$buttonProcesses.Text = 'Processes'
	$buttonProcesses.UseVisualStyleBackColor = $True
	$buttonProcesses.add_Click($buttonProcesses_Click)
	#
	# buttonServices
	#
	$buttonServices.Location = '12, 49'
	$buttonServices.Name = 'buttonServices'
	$buttonServices.Size = '120, 29'
	$buttonServices.TabIndex = 10
	$buttonServices.Text = 'Services'
	$buttonServices.UseVisualStyleBackColor = $True
	$buttonServices.add_Click($buttonServices_Click)
	#
	# buttonGetEventLog
	#
	$buttonGetEventLog.Location = '12, 13'
	$buttonGetEventLog.Name = 'buttonGetEventLog'
	$buttonGetEventLog.Size = '120, 29'
	$buttonGetEventLog.TabIndex = 9
	$buttonGetEventLog.Text = 'Get Event Log'
	$buttonGetEventLog.UseVisualStyleBackColor = $True
	$buttonGetEventLog.add_Click($buttonGetEventLog_Click)
	#
	# buttonRemoteSessions
	#
	$buttonRemoteSessions.Location = '12, 190'
	$buttonRemoteSessions.Name = 'buttonRemoteSessions'
	$buttonRemoteSessions.Size = '120, 27'
	$buttonRemoteSessions.TabIndex = 8
	$buttonRemoteSessions.Text = 'Remote Sessions'
	$buttonRemoteSessions.UseVisualStyleBackColor = $True
	$buttonRemoteSessions.add_Click($buttonRemoteSessions_Click)
	#
	# textboxUsername
	#
	$textboxUsername.Location = '476, 81'
	$textboxUsername.Name = 'textboxUsername'
	$textboxUsername.Size = '160, 20'
	$textboxUsername.TabIndex = 7
	$textboxUsername.Text = 'Defaults to Accounts Domain'
	#
	# labelEnterLoginID
	#
	$labelEnterLoginID.AutoSize = $True
	$labelEnterLoginID.Font = 'Microsoft Sans Serif, 10pt'
	$labelEnterLoginID.Location = '501, 61'
	$labelEnterLoginID.Name = 'labelEnterLoginID'
	$labelEnterLoginID.Size = '98, 17'
	$labelEnterLoginID.TabIndex = 6
	$labelEnterLoginID.Text = 'Enter Login ID'
	#
	# labelEnterServer
	#
	$labelEnterServer.AutoSize = $True
	$labelEnterServer.Font = 'Microsoft Sans Serif, 10pt'
	$labelEnterServer.Location = '302, 61'
	$labelEnterServer.Name = 'labelEnterServer'
	$labelEnterServer.Size = '88, 17'
	$labelEnterServer.TabIndex = 5
	$labelEnterServer.Text = 'Enter Server'
	#
	# txtBoxServerName
	#
	$txtBoxServerName.Location = '267, 81'
	$txtBoxServerName.Name = 'txtBoxServerName'
	$txtBoxServerName.Size = '160, 20'
	$txtBoxServerName.TabIndex = 4
	#
	# btnLoginID
	#
	$btnLoginID.Location = '533, 107'
	$btnLoginID.Name = 'btnLoginID'
	$btnLoginID.Size = '42, 26'
	$btnLoginID.TabIndex = 3
	$btnLoginID.Text = 'OK'
	$btnLoginID.UseVisualStyleBackColor = $True
	#
	# btnServer
	#
	$btnServer.Location = '321, 107'
	$btnServer.Name = 'btnServer'
	$btnServer.Size = '44, 27'
	$btnServer.TabIndex = 2
	$btnServer.Text = 'OK'
	$btnServer.UseVisualStyleBackColor = $True
	$formServerInfo.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $formServerInfo.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$formServerInfo.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$formServerInfo.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $formServerInfo.ShowDialog()

} #End Function

#Call the form
Call-ServerInfo_psf | Out-Null
	#Perform cleanup
	OnApplicationExit