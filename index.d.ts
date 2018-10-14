declare module 'react-native-awesome-card-io' {

  export interface Card {
    cardType: string;
    cardNumber: string;
    redactedCardNumber: string;
    expiryMonth: number;
    expiryYear: number;
    cvv: string;
    postalCode: string;
    scanned?: boolean;
    cardholderName: string;
  }

  interface CardIOConfig {
    languageOrLocale: string;
    guideColor: string;
    useCardIOLogo: boolean;
    hideCardIOLogo: boolean;
    allowFreelyRotationCardGuide: boolean;
    scanInstructions: string;
    scanExpiry: boolean;
    scannedImageDuration: number;
    detectionMode: DETECTION_MODE;
  }

  export interface CardIOVIewProps extends CardIOConfig {
    didScanCard(card: Card): void;
  }

  export class CardIOView extends React.Component<CardIOVIewProps> { }

  export type IMAGE_AND_NUMBER = string;
  export type IMAGE = string;
  export type AUTOMATIC = string;
  export type DETECTION_MODE = IMAGE_AND_NUMBER | IMAGE | AUTOMATIC;

  export interface ScanCardConfig extends CardIOConfig {
    suppressManualEntry: boolean;
    suppressConfirmation: boolean;
    requireExpiry: boolean;
    requireCVV: boolean;
    requirePostalCode: boolean;
    restrictPostalCode: boolean;
    requireCardholderName: boolean;
    disableBlurWhenBackgrounding: boolean;
    keepStatusBarStyle: boolean;
    suppressScannedCardImage: boolean;
    noCamera: boolean;
    unblurDigits: number;
    usePaypalActionbarIcon: boolean;
  }

  export class CardIOModule {
    static scanCard(config?: ScanCardConfig): Promise<Card>;
  }
  export class CardIOUtilities {
    static preload(): void;
  }
}
