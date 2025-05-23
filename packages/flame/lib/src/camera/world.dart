import 'dart:ui';

import 'package:flame/src/camera/camera_component.dart';
import 'package:flame/src/components/core/component.dart';
import 'package:flame/src/components/mixins/coordinate_transform.dart';
import 'package:vector_math/vector_math.dart';

/// The root component for all game world elements.
///
/// The primary feature of this component is that it disables regular rendering,
/// and allows itself to be rendered through a [CameraComponent] only. The
/// updates proceed through the world tree normally.
///
/// The [priority] of the world by default is the maximum 32bit negative int
/// value to ensure it will always be earlier in the component tree than a
/// [CameraComponent].
class World extends Component implements CoordinateTransform {
  World({
    super.children,
    super.priority = -0x7fffffff,
    super.key,
  });

  @override
  void renderTree(Canvas canvas) {}

  /// The rendering method invoked by the [CameraComponent].
  ///
  /// If you want to do changes to the rendering of the world, this is the
  /// method that you want to override, not [renderTree].
  void renderFromCamera(Canvas canvas) {
    assert(CameraComponent.currentCamera != null);
    super.renderTree(canvas);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  Vector2? localToParent(Vector2 point) => null;

  @override
  Vector2? parentToLocal(Vector2 point) => null;
}
