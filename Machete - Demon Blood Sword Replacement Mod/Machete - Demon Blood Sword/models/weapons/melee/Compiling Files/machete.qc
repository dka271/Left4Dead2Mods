$modelname weapons\melee\v_machete.mdl
$cdmaterials models\weapons\melee\
$include "Bones_Scripts\definebones.qci"
$include "Bones_Scripts\bonemerge.qci"

$body "Body" "v_machete_reference.smd"  

$surfaceprop "default"

$origin 0 1 58

$attachment attach_blade "ValveBiped.weapon_bone" 0 20 0 rotate 0 0 0 RIGID


// --------- Unique Animation sequences ------- 


$pushd "dmx\animation"


$sequence deploy "deploy.dmx" ACT_VM_DRAW 1

$animation a_pose_neutral "look_poses" frame 1 1 
$animation a_pose_trans_neutral "look_poses" frame 1 1 subtract a_pose_neutral 0
$animation a_pose_trans_up "look_poses" frame 2 2 subtract a_pose_neutral 0
$animation a_pose_trans_down "look_poses" frame 0 0 subtract a_pose_neutral 0

$sequence vaims {
	a_pose_trans_down a_pose_trans_neutral a_pose_trans_up 
	blend ver_aims  1 -1 
	delta hidden
	
	}

$animation a_run "run.dmx" fps 30
$animation a_idle "machete_idle.dmx" 
$sequence idle {
	a_run	a_idle a_run	
	blendwidth 3 
	blend move_x -1 1
	addlayer vaims
	loop
	ACT_VM_IDLE 1 

 }
 
 
//----- VIEWMODEL ANIMATIONS -------------------------------------

$sequence attack_ne_sw "attack_ne_sw.dmx"  			fps 40	ACT_VM_PRIMARYATTACK 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 7 "weapon_melee_blur_machete follow_attachment attach_blur"
}
$sequence attack_ne_sw_layer "attack_ne_sw.dmx" fps 40 	ACT_VM_SHOOT_LAYER 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 7 "weapon_melee_blur_machete follow_attachment attach_blur"
}

$sequence attack_e_w "attack_e_w.dmx"  			fps 40 	ACT_VM_HITLEFT 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}
$sequence attack_e_w_layer "attack_e_w.dmx" fps 40  	ACT_VM_HITLEFT_LAYER 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}

$sequence attack_w_e "attack_w_e.dmx"  		snap 	fps 35 	ACT_VM_HITRIGHT 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}
$sequence attack_w_e_layer "attack_w_e.dmx" snap fps 35  	ACT_VM_HITRIGHT_LAYER 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}

$sequence strong_swing "attack_n_s_strong.dmx"	ACT_VM_SWINGHARD 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}
$sequence strong_swing_layer "attack_n_s_strong.dmx" ACT_VM_SWINGHARD_LAYER 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}

$sequence secondary_attack "secondary_attack_r_hand.dmx"  ACT_VM_SECONDARYATTACK 1  {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}   
$sequence secondary_attack_layer "secondary_attack_r_hand.dmx" ACT_VM_SECONDARYATTACK_LAYER 1 {
event AE_CL_CREATE_PARTICLE_EFFECT 4 "weapon_melee_blur_machete follow_attachment attach_blur"
}
