using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ApplyMaterial : MonoBehaviour
{
    // Start is called before the first frame update
    public Material material;

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (material == null)
        {
            Graphics.Blit(source, destination);
            return;
        }

        Graphics.Blit(source, destination, material);
    }
}