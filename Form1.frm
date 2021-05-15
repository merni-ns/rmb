VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Merni's RMB archiver (GUI front-end)"
   ClientHeight    =   4905
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7995
   LinkTopic       =   "Form1"
   ScaleHeight     =   4905
   ScaleWidth      =   7995
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame2 
      Caption         =   "Advanced options (optional)"
      Height          =   4500
      Left            =   3120
      TabIndex        =   14
      Top             =   195
      Width           =   4695
      Begin VB.TextBox StartSerial 
         Height          =   285
         Left            =   2535
         TabIndex        =   20
         Text            =   "1"
         Top             =   2880
         Width           =   1185
      End
      Begin VB.TextBox FromID 
         Height          =   285
         Left            =   3120
         TabIndex        =   18
         ToolTipText     =   "Messages with this ID or any higher ID will be archived."
         Top             =   1560
         Width           =   1185
      End
      Begin VB.OptionButton ArchiveIDFrom 
         Caption         =   "Archive messages with IDs from"
         Height          =   210
         Left            =   195
         TabIndex        =   17
         Top             =   1597
         Width           =   2550
      End
      Begin VB.OptionButton ArchiveAll 
         Caption         =   "Archive all messages (default)"
         Height          =   210
         Left            =   195
         TabIndex        =   16
         Top             =   1170
         Width           =   2940
      End
      Begin VB.Label LabelStartSerial 
         AutoSize        =   -1  'True
         Caption         =   "Starting serial no.:"
         Height          =   195
         Left            =   1170
         TabIndex        =   21
         Top             =   2925
         Width           =   1260
      End
      Begin VB.Label LabelAdvExpl2 
         Caption         =   "In the archive, each message is given a serial number, by default 1, 2, 3.... You can change the starting serial number."
         Height          =   405
         Left            =   195
         TabIndex        =   19
         Top             =   2340
         Width           =   4305
      End
      Begin VB.Label LabelAdvExpl1 
         Caption         =   "These options can be used to filter the messages which are archived. All messages in a region's RMB will be archived by default."
         Height          =   600
         Left            =   195
         TabIndex        =   15
         Top             =   390
         Width           =   4110
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Basic"
      Height          =   4500
      Left            =   195
      TabIndex        =   0
      Top             =   195
      Width           =   2745
      Begin VB.TextBox FileName 
         Height          =   285
         Left            =   1170
         TabIndex        =   11
         ToolTipText     =   "File where RMB messages will be saved."
         Top             =   3120
         Width           =   1185
      End
      Begin VB.DirListBox Dir1 
         Height          =   990
         Left            =   195
         TabIndex        =   9
         ToolTipText     =   "Choose folder to save the file in. Double click a folder icon to expand it."
         Top             =   1950
         Width           =   2355
      End
      Begin VB.DriveListBox Drive1 
         Height          =   315
         Left            =   1170
         TabIndex        =   8
         ToolTipText     =   "Choose drive."
         Top             =   1170
         Width           =   1380
      End
      Begin VB.CommandButton Help 
         Caption         =   "Help"
         Height          =   405
         Left            =   195
         TabIndex        =   6
         Top             =   3900
         Width           =   990
      End
      Begin VB.CommandButton Start 
         Caption         =   "Start"
         Default         =   -1  'True
         Height          =   405
         Left            =   1365
         TabIndex        =   5
         Top             =   3900
         Width           =   990
      End
      Begin VB.TextBox Region 
         Height          =   285
         Left            =   1170
         TabIndex        =   2
         Text            =   "The Labyrinth"
         ToolTipText     =   "Messages from this region will be archived."
         Top             =   390
         Width           =   1380
      End
      Begin VB.TextBox Agent 
         Height          =   285
         Left            =   1170
         TabIndex        =   1
         ToolTipText     =   "Should contain your nation name or e-mail. The mods need this to keep track of API requests."
         Top             =   780
         Width           =   1380
      End
      Begin VB.Label LabelFile 
         AutoSize        =   -1  'True
         Caption         =   "File name:"
         Height          =   195
         Left            =   270
         TabIndex        =   13
         Top             =   3165
         Width           =   720
      End
      Begin VB.Label LabelTxt 
         AutoSize        =   -1  'True
         Caption         =   ".txt"
         Height          =   195
         Left            =   2340
         TabIndex        =   12
         Top             =   3165
         Width           =   210
      End
      Begin VB.Label LabelDir 
         AutoSize        =   -1  'True
         Caption         =   "Folder: (double click to select!)"
         Height          =   195
         Left            =   195
         TabIndex        =   10
         Top             =   1560
         Width           =   2160
      End
      Begin VB.Label LabelDrive 
         AutoSize        =   -1  'True
         Caption         =   "Drive:"
         Height          =   195
         Left            =   570
         TabIndex        =   7
         Top             =   1215
         Width           =   420
      End
      Begin VB.Label LabelUA 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "User agent:"
         Height          =   195
         Left            =   165
         TabIndex        =   4
         Top             =   810
         Width           =   825
      End
      Begin VB.Label LabelRegion 
         Alignment       =   1  'Right Justify
         Caption         =   "Region:"
         Height          =   210
         Left            =   195
         TabIndex        =   3
         Top             =   420
         Width           =   795
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Start_Click()

Rem Region name
Let R = Region.Text
Rem Useragent
Let U = Agent.Text
If R = Nil Or U = Nil Then GoTo 10
U = U & " using Merni's RMB archiving tool, github.com/merni-ns/rmb, GUI version."
Rem Drive
Let D = Drive1.Drive
Rem Folder
Let P = Dir1.Path
Rem Filename
Let F = FileName.Text
If D = Nil Or P = Nil Or F = Nil Then GoTo 50

Rem Full path
F = P & "\" & F & ".txt"

If ArchiveIDFrom.Value = True Then
If FromID.Text = Nil Then GoTo 80 Else I = FromID.Text
Else: I = Nil
End If

If StartSerial.Text = Nil Then Let S = 1 Else Let S = StartSerial.Text

Let M = "Click OK to start with following details: " & vbCrLf & "Region: " & R & vbCrLf & "User agent: " & U & vbCrLf
M = M & "Save to: " & F & vbCrLf
If I <> Nil Then M = M & "Start at ID " & I & vbCrLf
If S <> 1 Then M = M & "Start at serial " & S

Let Accept = MsgBox(M, vbOKCancel, "Confirm data")
Rem Cancel is 2

If Accept = 2 Then GoTo 1000

Let Query = "rmb.exe -u """ & U & """ -r """ & R & """ -o """ & F & """"
If I <> Nil Then Query = Query & " -i """ & I & """"
If S <> 1 Then Query = Query & " -s """ & S & """"
Shell Query, vbNormalFocus

Rem Do Query Here

MsgBox "The archiving has started." & vbCrLf & "Please DO NOT CLOSE the black console window or the program will stop. (You can safely close this window.)" & vbCrLf & "The console window wil print the number of messages done every 100 messages. It will close automatically when finished."

GoTo 1000
10 MsgBox "Region name and user agent are required.", vbCritical, "Error"
20 GoTo 1000

50 MsgBox "Drive, folder and file name are required.", vbCritical, "Error"
60 GoTo 1000

80 MsgBox "If selecting this option, ID to start from is required.", vbCritical, "Error"
90 GoTo 1000


1000 End Sub

Private Sub Help_Click()
CreateObject("Wscript.Shell").Run "https://merni.heliohost.org/rmb/help.html"
Rem may need to change the URL
End Sub

Private Sub Drive1_Change()
Dir1.Path = UCase$(Left$(Drive1.Drive, 1)) & ":\"
End Sub

Private Sub Form_Load()
ArchiveAll.Value = True
FileName.Text = "rmb_" & Format(Now, "yyyy_MM_ddThhmm")
End Sub
