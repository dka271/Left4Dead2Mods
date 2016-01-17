$modelname weapons\melee\w_machete.mdl
$cdmaterials models\weapons\melee\

$body w_machete "w_machete_reference.smd"  
$surfaceprop "default"

$root "ValveBiped.weapon_bone"

$attachment "null" "ValveBiped.weapon_bone" 0 0 0 rotate 0 0 0
$attachment "attach_blade" "ValveBiped.weapon_bone" 0 20 0 rotate 0 0 0

$bonemerge "ValveBiped.weapon_bone"

$sequence machete "w_machete_reference.smd" frames 0 0 numframes 10

//$physskin 2
//$physmaxpenetration 1
$collisionmodel "w_machete_reference.smd" 
{
//	Mass in kilograms 
    $Mass 20
    $concave
	$rotdamping 3
}