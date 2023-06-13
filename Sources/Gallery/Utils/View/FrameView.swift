import UIKit

class FrameView: UIView {

  lazy var label: UILabel = self.makeLabel()
  lazy var gradientLayer: CAGradientLayer = self.makeGradientLayer()
    lazy var btn: UIButton = self.makeButton()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Setup

  private func setup() {
    layer.addSublayer(gradientLayer)

      addSubview(btn)
      btn.g_pinR_l()
      btn.g_pin(size: CGSize(width: 22, height: 22))
      
    addSubview(label)
      label.g_pinR_l()
      label.g_pin(size: CGSize(width: 22, height: 22))
  }

  // MARK: - Layout

  override func layoutSubviews() {
    super.layoutSubviews()

    gradientLayer.frame = bounds
  }

  // MARK: - Controls

  private func makeLabel() -> UILabel {
    let label = UILabel()
      label.font = Config.Font.Main.regular.withSize(12)
      label.textColor = UIColor.white
      label.backgroundColor = UIColor.clear
      label.textAlignment = .center
    return label
  }

  private func makeGradientLayer() -> CAGradientLayer {
    let layer = CAGradientLayer()
    layer.colors = [
      Config.Grid.FrameView.fillColor.withAlphaComponent(0.25).cgColor,
      Config.Grid.FrameView.fillColor.withAlphaComponent(0.4).cgColor
    ]

    return layer
  }
    
    private func makeButton() -> UIButton {
        let btn = UIButton()
        btn.setImage(Config.Camera.nomalBtnImage, for: .normal)
        btn.setImage(Config.Camera.selectedBtnImage, for: .selected)
        btn.setTitleColor(UIColor.red, for: .selected)
        btn.titleLabel?.font = Config.Font.Main.regular.withSize(14)
        return btn
    }
}
