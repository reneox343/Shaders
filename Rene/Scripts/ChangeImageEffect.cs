using System;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using UnityEngine;
using UnityEngine.Rendering.Universal;

public class ChangeImageEffect : MonoBehaviour
{
    private List<ScriptableRendererFeature> _RendererFeatures;
    public KeyCode NightVisionSwitchKey;
    public string NightVisionName;

    private void Awake()
    {
        _RendererFeatures = GetRendererFeatures();
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if(Input.GetKeyDown(NightVisionSwitchKey)){
            SwitchValue(NightVisionName);
        }
    }
    
    public List<ScriptableRendererFeature> GetRendererFeatures(){
        UniversalAdditionalCameraData universalCamData = GetComponent<UniversalAdditionalCameraData>();
        if(universalCamData != null){
            ScriptableRenderer scriptableRenderer = universalCamData.scriptableRenderer;
            if(scriptableRenderer != null){
                PropertyInfo propertyInfo = scriptableRenderer.GetType().GetProperty("rendererFeatures", BindingFlags.NonPublic | BindingFlags.Instance);
                if(propertyInfo != null){
                    return propertyInfo.GetValue(scriptableRenderer, null) as List<ScriptableRendererFeature>;
                }
            }
        }
        return null;
    }
    
    public void SwitchValue(string valueName){
        if(_RendererFeatures != null){
            foreach(ScriptableRendererFeature rendererFeature in _RendererFeatures){
                if(rendererFeature.name.Equals(valueName)){
                    rendererFeature.SetActive(!rendererFeature.isActive);
                    break;
                }
            }
        }
    }
}
