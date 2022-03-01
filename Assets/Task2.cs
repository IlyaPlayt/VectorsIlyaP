using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.Serialization;

public class Task2 : MonoBehaviour
{
    [Range(-1,1)] [SerializeField] private float threshole;
    [SerializeField]  private  Transform targetPoint;

    private void OnDrawGizmos()
    {
        Vector3 vectroToTarget = targetPoint.position - transform.position;

        if (Vector3.Dot( targetPoint.forward,vectroToTarget.normalized)>threshole/*&& Vector3.Dot(transformPos,vectroToTarget)>-threshole*/)
        {
            Gizmos.color=Color.red;
        }
        else
        {
            Gizmos.color=Color.white;
        } 
        Gizmos.DrawRay(transform.position, vectroToTarget.normalized);
        Gizmos.DrawRay(targetPoint.position,targetPoint.forward);
        
    }
}
