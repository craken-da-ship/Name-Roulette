Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'GUI for my script'
$main_form.Width = 400
$main_form.Height = 200

$Label = New-Object System.Windows.Forms.Label
$Label.Text = "Click Button to generate Lucky Winner"
$Label.Location  = New-Object System.Drawing.Point(0,30)
$Label.AutoSize = $true
$main_form.Controls.Add($Label)

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = ""
$Label3.Location  = New-Object System.Drawing.Point(100,100)
$Label3.AutoSize = $true
$main_form.Controls.Add($Label3)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(200,30)
$Button.Size = New-Object System.Drawing.Size(120,23)
$Button.Text = "Randomize"
$main_form.Controls.Add($Button)

$Button.Add_Click(
{
$Text = Get-Content .\ClassList.txt 
$measure =  Get-Content .\ClassList.txt | Measure-Object
$lines = $measure.Count
$Rand = Get-Random -Maximum $lines
$Label3.Text = $Text[$Rand]
}
)

$main_form.ShowDialog()
