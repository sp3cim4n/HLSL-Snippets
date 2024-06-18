float3 TriplanerTextureSeamless(float3 N, float3 TexXPlane, float3 TexYPlane, float3 TexZPlane, float Blur)
{
  N = abs(N);

  float t0 = ((N.y-N.x)/Blur);
  float3 MaskXY = lerp(float3(1,0,0), float3(0,1,0), saturate((t0+1)*0.5));
  float t1 = ((N.z-max(N.x,N.y))/Blur);
  float3 MaskXYZ = lerp(MaskXY, float3(0,0,1), saturate((t1+1)*0.5));

  return TexXPlane*MaskXYZ.x + TexYPlane*MaskXYZ.y + TexZPlane*MaskXYZ.z
}
