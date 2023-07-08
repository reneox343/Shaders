using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivateCameraShader : MonoBehaviour
{
    // Start is called before the first frame update
    public Material cameraMaterial;
    public GameObject volume;
    public Camera mainCamera;
    public KeyCode key;
    private float active;
    void Start()
    {
        //active = cameraMaterial.GetFloat("_Active");
        active = 0;
        cameraMaterial.SetFloat("_Active", active);
        if (volume)volume.SetActive(getBool(active));
        changeCamera(active);
        
        

    }

    void changeCamera(float active){
        if(!mainCamera)return;
        if(active == 0){
            mainCamera.clearFlags = CameraClearFlags.Skybox;
        }else{
            mainCamera.clearFlags = CameraClearFlags.SolidColor;
            mainCamera.backgroundColor = Color.white;
        }
    }

    bool getBool(float value)
    {
        if(value == 1)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(key)){
            if(active == 0){
                active = 1;
            }else if(active == 1){
                active = 0;
            }
            cameraMaterial.SetFloat("_Active",active);
            if (volume) volume.SetActive(getBool(active));
            changeCamera(active);
        }
    }
}
