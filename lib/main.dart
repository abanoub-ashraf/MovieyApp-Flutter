import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/moviey_app.dart';
import 'di/get_it.dart' as getIt;

///
/// - clean architecture:
/// =====================
///     - the layers of the apps are presentation, domain and data
/// 
///     - presentation layer is the ui
/// 
///     - presentation layer is combination of widgets that makes a screen 
///       and the screen is called a journey
/// 
///     - data layer is responsible for bringing data from outside world like a rest api
/// 
///     - domain layer acts as a communication channel between the presentation layer 
///       and the data layer
/// 
///     - presentation and data layers both depend on the domain layer and they never interact
///       with each other
/// 
///     - common folder contains constants, extensions and utils in general
///
///
/// - presentation layer contains:
/// ==============================
///     - blocs
/// 
///     - screens
/// 
///     - themes
/// 
///     - widgets
///
/// - data layer contains:
/// ======================
///     - data sources: 
///         - the sources of the data in the app local or or external
/// 
///     - repositories:
///         - makes decisions whether to fetch data from local or remote data source
/// 
///         - implements the repositories abstract classes of the domain layer
/// 
///     - models: 
///         - extensions of the entities presenting the domain layer
/// 
///         - mapped directly from the api response
/// 
///     - tables: 
///         - extensions of the entities presenting the domain layer
/// 
///         - mapped directly from the database response
/// 
///     - core:
///         - contains all the behaviors of fetching and parsing the data
/// 
///  - domain layer contains:
/// =========================
///     - entities:
///         - represents the data that will be required by the ui
/// 
///         - they will be extended by models and tables in the data layer
/// 
///     - repositories: 
///         - abstract classes that only tells what data has to be fetched but the decision of
///           what data to be fetched and how, is made by the repositories of the data layer
/// 
///     - usecases:
///         - contains the features that the app will work on
/// 
///         - simple classes that directly pass the input parameters required to fetch details
///           to the repository
/// 
///         - directly interact with the blocs
/// 
/// - common folder:
/// ================
///     - constants, extensions, and things that are used by the whole app
/// 
/// - di folder:
/// ============
///     - contains the dependency injection files
/// 
///     - will provides all the instances of repositories, data sources, usecases, etc
///
/// - app flow:
/// ===========
///
///     1- datasources of the data layer will fetch data from the api
/// 
///     2- the api responses wil be stored in the models in the data layer
/// 
///     3- repositories [Data layer] will implement the repositories [Domain layer] and will call 
///        the datasource [Data Layer] functions to use the data we got from the api
/// 
///     4- usecases of the domain layer will use the repository [Domain Layer] functions to give 
///        them their to the ui
///

void main() {
    WidgetsFlutterBinding.ensureInitialized();

    unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
    
    ///
    /// - unawaited means don't wait for the future till its done and keep going 
    ///   through the rest of the app
    /// 
    /// - we solved all the dependency injection in a separate file inside a future function
    ///   and we just wanna initialize that future function cause we need the first use of 
    ///   its content but also without waiting for its future return type to wait, 
    ///   we will ignore it
    ///
    unawaited(getIt.init());
    
    runApp(const MovieyApp());
}