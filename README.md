# TemplateApp_RnP
TemplateApp for Robots &amp; Pencils

Target classes demanded:
 - RPComment
 - RPAnnotation

Supporting Protocol(s):
 - Sustainable

Models in MVVM: (handle and hide the physical source of storage)
 - ParseModel
 - RESTfulModel
 - UserDefaultsModel
(Note that currently Parse API and RESTful API are undefined yet, ParseModel and RESTfulModel will call UserDefaultsModel for simulation.)

ViewModels in MVVM:
(TBD, not required currently)

Views (ViewControllers + Views) in MVVM:
(TBD, not required currently)

Enums:
 - StorageErrorInfo
 - StorageType

UnitTest case(s) (in TemplateAppTests/TemplateAppTests.swift):
 - testRPCommentSustainability
 - testRPAnnotationSustainability

In-app test:
 - Test.test() called by application(application, didFinishLaunchingWithOptions) in AppDelegate.swift
