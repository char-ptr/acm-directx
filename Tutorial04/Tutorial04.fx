//--------------------------------------------------------------------------------------
// File: Tutorial04.fx
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Constant Buffer Variables
//--------------------------------------------------------------------------------------
cbuffer ConstantBuffer : register( b0 )
{
	matrix World;
	matrix View;
	matrix Projection;
}

//--------------------------------------------------------------------------------------
struct VS_INPUT
{
    float4 Pos : POSITION;
    float3 Norm : NORMAL;
    float4 Color : COLOR0;
};

struct PS_INPUT
{
    float4 Pos : VS_POSITION;
    float3 Norm : VS_NORMAL;
    float4 Color : COLOR0;
};

//--------------------------------------------------------------------------------------
// Vertex Shader
//--------------------------------------------------------------------------------------
<<<<<<< HEAD
PS_INPUT VS( VS_INPUT input )
{
    PS_INPUT output = (PS_INPUT)0;
    output.Pos = mul( input.Pos, World );
    output.Pos = mul( output.Pos, View );
    output.Pos = mul( output.Pos, Projection );
	output.Norm = mul( float4(input.Norm, 1), World ).xyz;
=======
VS_INPUT VS( VS_INPUT input )
{
    VS_INPUT output = (VS_INPUT)0;
    output.Pos = mul( input.Pos, World );
    output.Pos = mul( output.Pos, View );
    output.Pos = mul( output.Pos, Projection );
    output.Norm = mul( float4(input.Norm, 1.0f), World ).xyz;
>>>>>>> ede32f160a5351ebe09d49fdaeaef169465ed1bd
    output.Color = input.Color;
    return output;
}


//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------
float4 PS( PS_INPUT input ) : SV_Target
{
<<<<<<< HEAD
    return dot(float3(0.6f, -0.8f, 0.0f), input.Norm) * input.Color;
=======
    float3 lightDir = float3(0.6f, -0.8f, 0.0f);
    float d = dot( lightDir, input.Norm );
    return input.Color * d;
>>>>>>> ede32f160a5351ebe09d49fdaeaef169465ed1bd
}
