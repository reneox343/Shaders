using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerLook : MonoBehaviour
{
    float xRotation = 0f;
    public Vector2 turn;
    public float sensitivity = 100;
    void Start()
    {
        Cursor.lockState = CursorLockMode.Locked;
    }
    void Update()
    {
        turn.x += Input.GetAxis("Mouse X") * sensitivity * Time.deltaTime;
        turn.y = Input.GetAxis("Mouse Y") * sensitivity * Time.deltaTime;
        xRotation -= turn.y;
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);
        transform.localRotation = Quaternion.Euler(xRotation, turn.x, 0);
    }
}
