//
//  LocalizableStringsUtil.swift
//  MercadoPagoSDK
//
//  Created by AUGUSTO COLLERONE ALFONSO on 7/26/17.
//  Copyright © 2017 MercadoPago. All rights reserved.
//

import Foundation

public class LocalizableStringsUtil: NSObject {
    
    //Basic UI
    open static let SI = "Si".localized
    open static let NOn = "No".localized
    open static let OK = "OK".localized
    open static let CARGANDO = "Cargando...".localized
    open static let ERROR = "Hubo un error".localized
    open static let CONTINUAR = "Continuar".localized
    open static let ANTERIOR = "Anterior".localized
    open static let SIGUIENTE = "Siguiente".localized
    open static let CANCELAR = "Cancelar".localized
    open static let SALIR = "Salir".localized
    open static let REINTENTAR = "Reintentar".localized
    
    
    //Coupon
    open static let CODIGO_DE_DESCUENTO = "Código de descuento".localized
    
    
    
    open static let LARGO_CVV_INVALIDO = "Ingresa los %1$s números del código de seguridad".localized
    open static let CAMPO_INVALIDO = "Revisa este dato".localized
    open static let LARGO_TARJETA_INVALIDO = "Ingresa los %1$s números de la tarjeta".localized
    open static let LARGO_TARJETA_INVALIDO_GENERAL = "Ingresa todos los números de la tarjeta".localized
    open static let CVV = "Código de seguridad".localized
    
    open static let CVV_LOCATION_NUMBERS = "Últimos %1$s números al dorso de la tarjeta".localized //NO SE USA
    open static let CVV_LOCATION_NUMBERS_AMEX = "%1$s números al frente de la tarjeta".localized //NO SE USA
    open static let SELECCIONA_CANTIDAD_CUOTAS = "Selecciona la cantidad de cuotas".localized //NO SE USA
    open static let CUOTAS = "Cuotas".localized //NO SE USA
    open static let CUOTAS_SIN_INTERES = "cuotas sin interés".localized//NO SE USA
    open static let NO_SE_ENCONTRARON_CUOTAS = "No se encontraron cuotas disponibles para un monto de $".localized
    
    open static let ERROR_DE_PAGO = "No se pudo realizar el pago.".localized
    open static let NO_SE_ENCONTRARON_MEDIO_DE_PAGO = "No se ha podido obtener los métodos de pago con esta preferencia".localized
    open static let VISA = "Visa".localized
    open static let MASTER = "Mastercard".localized
    open static let AMEX = "Amex".localized
    
    open static let CANCELAR_PAGO = "Cancelar pago".localized
    open static let QUE_PUEDO_HACER = "¿Qué puedo hacer?".localized
    open static let DEBES_AUTORIZAR = "Debes autorizar ante %p el pago de %t a MercadoPago".localized
    open static let YA_AUTORIZE = "Ya hable con %0 y me autorizó".localized
    open static let TELEFONO_EN_DORSO_TARJETA = "El teléfono está al dorso de tu tarjeta.".localized
    open static let PAGAR_CON_OTRO_MEDIO = "Pagar con otro medio".localized
    open static let PAGO_ACREDITADO = "¡Listo, se acreditó tu pago!".localized
    open static let CODIGO_ENVIADO_POR_EMAIL = "Te enviaremos este comprobante a %0".localized
    open static let CODIGO_ENVIADO_POR_EMAIL_GENERAL = "También enviamos el código a tu email".localized
    open static let DINERO_EN_CUENTA_MP = "Dinero en cuenta de MercadoPago".localized

    open static let TERMINADA_EN = "Terminada en ".localized
    open static let EN_TU_ESTADO_VERAS_EL_CARGO_COMO = "En tu estado de cuenta verás el cargo como %0".localized
    open static let COMPROBANTE = "Comprobante".localized
    open static let ESTAMOS_PROCESANDO_EL_PAGO = "Estamos procesando el pago".localized
    open static let EN_MENOS_DE_UNA_HORA_TE_ENVIAREMOS = "En menos de 1 hora te enviaremos por e-mail el resultado.".localized
    open static let EN_MENOS_DE_2_DIAS_TE_ENVIAREMOS = "En menos de 2 días hábiles te diremos por e-mail si se acreditó o si necesitamos más información.".localized
    
//    "rejected_high_risk_title"="Por seguridad, tuvimos que rechazar tu pago";
//    "cc_rejected_insufficient_amount_title" = "Tu %0 no tiene fondos suficientes";
//    "cc_rejected_other_reason_title"="%0 no procesó el pago";
//    "cc_rejected_max_attempts_title"= "Llegaste al límite de intentos permitidos";
//    "cc_rejected_duplicated_payment_title"="%0 no procesó el pago";
//    "cc_rejected_card_disabled_title"="Llama a %0 para que active tu tarjeta";
//    "cc_rejected_bad_filled_other_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_card_number_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_security_code_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_date_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_call_for_authorize_title" = "¿No pudiste autorizarlo?";


//    "cc_rejected_bad_filled_other_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_card_number_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_security_code_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_bad_filled_date_title"="Algún dato de tu %0 es incorrecto";
//    "cc_rejected_call_for_authorize_title" = "¿No pudiste autorizarlo?";
    
    open static let INGRESALO_NUEVAMENTE = "Ingresalo nuevamente".localized
    open static let ALGO_SALIO_MAL = "Algo salió mal… ".localized
    
//    "rejected_high_risk_subtitle_credit_card"="Si quieres pagar con el dinero de tu cuenta, contáctate con Atención al Cliente de MercadoPago. \n\nO si prefieres, puedes elegir otro medio de pago.";
//    "cc_rejected_insufficient_amount_subtitle_credit_card" = "¡No te desanimes! Puedes elegir otro medio de pago.";
//    "cc_rejected_other_reason_subtitle_credit_card"="Usa otra tarjeta u otro medio de pago.";
//    "cc_rejected_max_attempts_subtitle_credit_card"= "Elige otra tarjeta u otro medio de pago.";
//    "cc_rejected_duplicated_payment_subtitle_credit_card"="Si necesitas volver a pagar usa otra tarjeta u otro medio de pago.";
//    "cc_rejected_card_disabled_subtitle_credit_card"="El teléfono está al dorso de tu tarjeta.";
//    "cc_rejected_bad_filled_card_number_subtitle_credit_card"="El número de tu %0 es incorrecto.";
//    "cc_rejected_bad_filled_security_code_subtitle_credit_card"="El código de seguridad no es el correcto.";
//    "cc_rejected_bad_filled_date_subtitle_credit_card"="La fecha de vencimiento no es la correcta.";
//    "cc_rejected_call_for_authorize_subtitle_credit_card" = "";
    
//    "rejected_high_risk_subtitle_debit_card"="Si quieres pagar con el dinero de tu cuenta, contáctate con Atención al Cliente de MercadoPago. O si prefieres, puedes elegir otro medio de pago.";
//    "cc_rejected_insufficient_amount_subtitle_debit_card" = "¡No te desanimes! Recárgala en cualquier banco o desde tu banca electrónica e inténtalo de nuevo. O si prefieres, puedes elegir otro medio de pago.";
//    "cc_rejected_other_reason_subtitle_debit_card"="Usa otra tarjeta u otro medio de pago.";
//    "cc_rejected_max_attempts_subtitle_debit_card"= "Elige otra tarjeta u otro medio de pago.";
//    "cc_rejected_duplicated_payment_subtitle_debit_card"="Si necesitas volver a pagar usa otra tarjeta u otro medio de pago.";
//    "cc_rejected_card_disabled_subtitle_debit_card"="El teléfono está al dorso de tu tarjeta.";
//    "cc_rejected_bad_filled_card_number_subtitle_debit_card"="El número de tu %0 es incorrecto.";
//    "cc_rejected_bad_filled_security_code_subtitle_debit_card"="El código de seguridad no es el correcto.";
//    "cc_rejected_bad_filled_date_subtitle_debit_card"="La fecha de vencimiento no es la correcta.";
//    "cc_rejected_call_for_authorize_subtitle_debit_card" = "";
    
    //CARD FORM
    open static let VER_PROMOCIONES = "Ver promociones".localized
    open static let NUMERO_DE_TARJETA = "Número de tarjeta".localized
    open static let NOMBRE_APELLIDO = "NOMBRE APELLIDO".localized
    open static let MONTH_YEAR = "MM/AA".localized
    open static let FECHA_DE_EXPIRACION = "Fecha de expiración".localized
    open static let CODIGO_DE_SEGURIDAD = "Código de seguridad".localized
    open static let INGRESAR_NUMERO_TARJETA = "Ingresa el número de la tarjeta de crédito".localized
    open static let INGRESA_NOMBRE_EN_TARJETA = "Ingresa el nombre y apellido impreso en la tarjeta".localized
    open static let METODO_DE_PAGO_NO_SOPORTADO = "Método de pago no soportado".localized
    open static let NOMBRE_Y_APELLIDO = "Nombre y apellido".localized
    
    //IDENTIFICATION
    open static let DOCUMENTO_TITULAR_TARJETA = "DOCUMENTO DEL TITULAR DE LA TARJETA".localized
    open static let NUMERO = "Número".localized
    open static let TIPO = "Tipo".localized
    
    //ADDITIONAL STEP
        //PAYER COST
    open static let EN_CUANTAS_CUOTAS = "¿En cuántas cuotas?".localized
    open static let NO_INCLUYE_INTERES_BANCARIOS = "No incluye intereses bancarios".localized
    
        //ISSUER
    open static let EMISOR_TARJETA = "¿Quién emitió tu tarjeta?".localized
    
        //CARD TYPE
    open static let TIPO_DE_TARJETA = "¿Qué tipo de tarjeta es?".localized
    open static let CREDITO = "Crédito".localized
    open static let DEBITO = "Débito".localized
    
        //ENTITY TYPE
    open static let TIPO_DE_PERSONA = "¿Cuál es el tipo de persona?".localized
    open static let NATURAL = "Natural".localized
    open static let JURIDICA = "Jurídica".localized
    
        //FINANCIAL INSTITUTIONS
    open static let CUAL_ES_TU_BANCO = "¿Cuál es tu banco?".localized
    
    
    //INSTRUCTIONS
    open static let FELICITACIONES = "¡Felicitaciones!".localized
    open static let SE_APROBO_TU_PAGO = "Se aprobó tu pago.".localized
    open static let ESTAMOS_PROCESANDO = "Estamos procesando el pago".localized//REPETIDA
    open static let ERROR_UPS = "¡Ups! Ocurrió un problema".localized
    open static let IMPRIME_Y_PAGA = "Imprime el cupón y paga. Se acreditará en 1 a 3 días hábiles.".localized
    open static let EN_UNOS_MINUTOS_ENVIAREMOS = "En unos minutos te enviaremos por e-mail el resultado.".localized
    
    
    
    
    open static let TERMINADA_EN_LOWER_CASED = "terminada en ".localized
    open static let SIN_INTERES = "Sin interés".localized
    open static let ERROR_PAGO_UY = "Uy, no pudimos procesar el pago".localized
    open static let ALGUN_DATO_INCORRECTO = "Algún dato de tu %1$s es incorrecto.".localized
    open static let AUTORIZA_EL_PAGO_EN_TU_TARJETA = "Debes autorizar el pago ante tu tarjeta".localized
    open static let AUTORIZA_EL_PAGO_EN_TU_TARJETA_DE_X = "Debes autorizar ante %1$s el pago de ".localized
    open static let A_MERCADOPAGO = " a MercadoPago".localized
    open static let EN_POQUITAS_HORAS_MAIL = "En poquitas horas te diremos por e-mail si se acreditó o si necesitamos más información.".localized
    open static let TOTAL = "Total".localized
    open static let MEDIO_DE_PAGO = "Medio de pago".localized
    open static let OPERACION = "Operación".localized
    open static let FECHA = "Fecha".localized
    
    //RyC
    open static let REVISA_TODO = "Revisa si está todo bien...".localized
    open static let TOTAL_A_PAGAR = "Total a pagar ".localized
    open static let ACEPTO_TERMINOS_Y_CONFICIONES = "Al pagar, afirmo que soy mayor de edad y acepto los Términos y Condiciones de Mercado Pago".localized
    open static let COMO_QUIERES_PAGAR = "¿Cómo quiéres pagar?".localized
    open static let TERMINOS_Y_CONDICIONES = "Términos y Condiciones".localized
    open static let CON_DINERO_EN_CUENTA = "Con dinero en cuenta".localized

    
    
    
    
    
    
    
    
    
//    "ryc_title_default"=" en un ";
//    "ryc_title_cargavirtual"=" en ";
//    "ryc_title_redlink_bank_transfer"=" en tu ";
//    "ryc_title_bancomer_bank_transfer"=" en tu ";
//    "ryc_title_serfin_bank_transfer"=" en tu ";
//    "ryc_title_banamex_bank_transfer"=" en tu ";
//    
//    "ryc_complementary_bancomer_bank_transfer"="Home Banking de ";
//    "ryc_complementary_serfin_bank_transfer"="Home Banking de ";
//    "ryc_complementary_redlink_bank_transfer"="Home Banking de ";
//    "ryc_complementary_banamex_bank_transfer"="Home Banking de ";
//    "ryc_complementary_banamex_atm"="cajero automático de ";
//    "ryc_complementary_redlink_atm"="cajero automático de ";
//    
//    "ryc_payment_method_redlink_atm" = "Red Link";
//    "ryc_payment_method_redlink_bank_transfer" = "Red Link";
//    
//    //Discount
//    "Código de descuento"="Código de descuento";
    open static let CANJEAR = "Canjear".localized
//    "Código inválido"="Código inválido";
//    "de descuento"="de descuento";
//    "Tengo un descuento"="Tengo un descuento";
//    "Total: "="Total: ";
//    "Vendedor sin descuento disponible"="Vendedor sin descuento disponible";
//    "Se agotó la cantidad de usos"="Se agotó la cantidad de usos";
//    "Importe fuera del alcance"="Importe fuera del alcance";
//    "La campaña expiró"="La campaña expiró";
//    
//    // Unlock Card
//    "Recuerda desbloquear tu tarjeta antes de confirmar el pago."="Recuerda desbloquear tu tarjeta antes de confirmar el pago.";
//    "desbloquear tu tarjeta"="desbloquear tu tarjeta";
//    "Desbloqueo de Tarjeta"="Desbloqueo de Tarjeta";
//    
//    //Administrador de tarjetas
    open static let CON_QUE_TARJETA = "¿Con qué tarjeta?".localized
    

    
    
    

    
    

}
