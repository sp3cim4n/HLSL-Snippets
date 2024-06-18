/** Triplaner UV */
float2 TriplanerUV(float3 N, float3 Pos)
{
  N = abs(N);

  float3 MaskXY = lerp(float3(1,0,0), float3(0,1,0), step(N.x,N.y));
  float3 MaskXYZ = lerp(XY, float3(0,0,1), step(max(N.x,N.y), N.z));

  //UV = xplane*xmask + yplane*ymask + zplane*zmask
    return Pos.yz * MaskXYZ.x + Pos.xz * MaskXYZ.y + Pos.xy * MaskXYZ.z;
}
