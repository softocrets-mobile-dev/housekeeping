# Project Rules

## Project Overview
This project follows the feature-wise MVVM (Model-View-ViewModel) architecture. Each feature has its own dedicated Model, View, and ViewModel folder. The project adheres to lint rules to ensure code quality and consistency.

## Modules and Timeline
The project consists of four main modules:

1. **Authentication (Login, Logout, and Change Password)**
2. **Dashboard**
3. **Inventory**
4. **Activity Log**

## MVVM Architecture Directory Structure
The following is the directory structure for a Flutter project following the MVVM architecture:

```
/lib
  /features
    /authentication
      /model
      /view
      /viewmodel
    /dashboard
      /model
      /view
      /viewmodel
    /inventory
      /model
      /view
      /viewmodel
    /activity_log
      /model
      /view
      /viewmodel
  /common
    /widgets
    /utils
  /networking
  /configuration
    /route
    /theme
    /app_color
    /images
  /storage
    /local_storage
  /main.dart
```

## Lint Rules
The project adheres to the following lint rules to maintain code quality:
- Consistent naming conventions
- Proper use of comments and documentation
- Avoidance of unused imports and variables
- Proper indentation and formatting
- Use of const constructors where possible
- Avoidance of deeply nested code

By following these rules and structure, the project aims to maintain a clean, scalable, and maintainable codebase.
