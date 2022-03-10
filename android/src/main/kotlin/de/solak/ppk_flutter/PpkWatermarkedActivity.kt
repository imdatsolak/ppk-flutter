/*
 * **********************************************************************
 * PPK Flutter - A plugin to provide expanded Interface to PSPDFKit
 *
 * Copyright (c) 2021 Imdat Solak (imdat@solak.de)
 *
 * For license, check out LICENSE.txt in the root of this repository
 * **********************************************************************
 */

// NOTE: This code is originally based on code from PSPDFKit, Copyright PSPDFKit GmbH
// I have mostly ported it to Kotlin;
// it is only a stop-gap solution until I have integrated views for Android as well
// meaning: Flutter Widget on Android

package de.solak.ppk_flutter

import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.ColorFilter
import android.graphics.Matrix
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.Point
import android.graphics.Rect
import android.graphics.RectF
import android.os.Bundle
import androidx.annotation.IntRange
import androidx.annotation.UiThread
import com.pspdfkit.document.PdfDocument
import com.pspdfkit.ui.drawable.PdfDrawable
import com.pspdfkit.ui.drawable.PdfDrawableProvider
import kotlin.math.*

var watermarkString: String? = null

class PpkWatermarkedActivity: PpkActivity() {
  companion object {
    fun setWatermarkString(watermark: String) {
      watermarkString = watermark
    }
  }

  override fun onCreate(bundle: Bundle?) {
    super.onCreate(bundle)
    val customTestDrawableProvider: PdfDrawableProvider = getCustomTestDrawableProvider()

    pdfFragment!!.addDrawableProvider(customTestDrawableProvider)

    val thumbnailBarView = pspdfKitViews.thumbnailBarView
    thumbnailBarView?.addDrawableProvider(customTestDrawableProvider)

    val thumbnailGridView = pspdfKitViews.thumbnailGridView
    thumbnailGridView?.addDrawableProvider(customTestDrawableProvider)

    val outlineView = pspdfKitViews.outlineView
    outlineView?.addDrawableProvider(customTestDrawableProvider)
  }

  private fun getCustomTestDrawableProvider(): PdfDrawableProvider {
    return object : PdfDrawableProvider() {
      override fun getDrawablesForPage(
        context: Context,
        document: PdfDocument,
        @IntRange(from = 0) pageIndex: Int
      ): List<PdfDrawable> {
        if (watermarkString == null) {
          watermarkString = "This preview was generated using netfiles app for Android."
        }
        return listOf(WatermarkDrawable(watermarkString!!, Point(50, 350)))
      }
    }
  }

  internal class WatermarkDrawable(text: String, startingPoint: Point) : PdfDrawable() {
    private val watermarkPaint = Paint()
    private val pageCoordinates = RectF()
    private val screenCoordinates = RectF()
    private val watermarkText: String = text.repeat(10)

    init {
      watermarkPaint.color = Color.GRAY
      watermarkPaint.style = Paint.Style.FILL
      watermarkPaint.alpha = 80
      watermarkPaint.textSize = 48f
      calculatePageCoordinates(text, startingPoint)
    }

    private fun calculatePageCoordinates(text: String, point: Point) {
      val textBounds = Rect()
      watermarkPaint.getTextBounds(text, 0, text.length, textBounds)
      pageCoordinates[point.x.toFloat(), (point.y + textBounds.height()).toFloat(), (point.x + textBounds.width()).toFloat()] =
        point.y.toFloat()
    }

    private fun updateScreenCoordinates() {
      val bounds = bounds
      getPdfToPageTransformation().mapRect(screenCoordinates, pageCoordinates)
      screenCoordinates.roundOut(bounds)
      setBounds(bounds)
    }

    override fun draw(canvas: Canvas) {
      val bounds = bounds
      canvas.save()
      canvas.rotate(-15f, bounds.left.toFloat(), bounds.bottom.toFloat())
      setTextSizeForWidth(watermarkPaint, bounds.width().toFloat(), watermarkText)
      for (i in 0..99) {
        canvas.drawText(watermarkText, 0f, (i * 100).toFloat(), watermarkPaint)
      }
      canvas.restore()
    }

    private fun setTextSizeForWidth(paint: Paint, desiredWidth: Float, text: String) {
      val testTextSize = 60f
      val bounds = Rect()
      paint.textSize = testTextSize
      paint.getTextBounds(text, 0, text.length, bounds)
      val desiredTextSize = testTextSize * desiredWidth / bounds.width()
      paint.textSize = max(desiredTextSize, 48f)
    }

    override fun updatePDFToViewTransformation(matrix: Matrix) {
      super.updatePDFToViewTransformation(matrix)
      updateScreenCoordinates()
    }

    @UiThread
    override fun setAlpha(alpha: Int) {
      watermarkPaint.alpha = alpha
      invalidateSelf()
    }

    @UiThread
    override fun setColorFilter(colorFilter: ColorFilter?) {
      watermarkPaint.colorFilter = colorFilter
      invalidateSelf()
    }

    override fun getOpacity(): Int {
      return PixelFormat.TRANSLUCENT
    }
 }
}
