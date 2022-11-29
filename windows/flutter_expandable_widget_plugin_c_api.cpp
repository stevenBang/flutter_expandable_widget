#include "include/flutter_expandable_widget/flutter_expandable_widget_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_expandable_widget_plugin.h"

void FlutterExpandableWidgetPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_expandable_widget::FlutterExpandableWidgetPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
