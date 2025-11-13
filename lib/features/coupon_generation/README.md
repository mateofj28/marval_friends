# Coupon Generation Feature

Feature para la generación de cupones con validación de montos y visualización de códigos QR y de barras.

## Estructura

```
coupon_generation/
├── presentation/
│   ├── pages/
│   │   └── coupon_generation_page.dart    # Página principal con formulario
│   └── widgets/
│       └── coupon_display.dart            # Widget para mostrar cupón generado
└── README.md
```

## Funcionalidad

### Validación de Montos
- Monto mínimo: $2.000
- Monto máximo: $3.000.000
- Solo acepta valores numéricos
- Mensajes de error claros para valores fuera de rango

### Generación de Cupones
- Código único generado por timestamp
- Visualización con QR code
- Visualización con código de barras
- Fecha de expiración (30 días)

### Navegación
Se accede desde `RewardsRedeemPage` al tocar cualquier tarjeta de marca.

## Dependencias
- `qr_flutter: ^4.1.0` - Generación de códigos QR
- `barcode_widget: ^2.0.4` - Generación de códigos de barras
