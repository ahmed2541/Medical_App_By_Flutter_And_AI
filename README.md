# medicalappsproject

Medical Application with Flutter and Ai

## Getting Started

Medicine field one of the most important science in our life and what about if we mix it with engineering ?, this is our plan that we designed the app, medical application deployed in flutter to give the application artificial mentality to diagnose multiple diseases with out human interaction and with high accuracy over humans using deep leaning and computer vision techniques.

Refrences:
    - Bone Fracture : https://www.pennmedicine.org/for-patients-and-visitors/patient-information/conditions-treated-a-to-z/bone-fractures
    - Brain Tumor : https://www.mayoclinic.org/diseases-conditions/brain-tumor/symptoms-causes/syc-20350084
    - Heart Disease : https://www.mayoclinic.org/diseases-conditions/heart-disease/symptoms-causes/syc-20353118






Some Erorrs And Sol :
    ---1------
    - يجب تعديل ملف build.gradle للمكون الإضافي tflite في المسار C:\Users\hp\AppData\Local\Pub\Cache\hosted\pub.dev\tflite-1.1.2\android\build.gradle، وذلك بتغيير الكلمة compile إلى implementation في جملة الاعتماديات (dependencies) كما يلي:

```
dependencies {
    implementation 'org.tensorflow:tensorflow-lite:+'
    implementation 'org.tensorflow:tensorflow-lite-gpu:+'
}
```

بعد الانتهاء من التعديلات، يجب حفظ الملف وإعادة تشغيل عملية البناء (build) لتطبيق Flutter الخاص بك.

أتمنى أن يساعد هذا الحل في حل مشكلة الخطأ الذي تواجهه.
