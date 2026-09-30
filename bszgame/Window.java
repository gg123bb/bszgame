package bszgame;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class Window extends JFrame implements MouseListener, MouseMotionListener {
  Canvas c;
  
  public Window() {
    super("canvas");
    c = new Canvas() {
      public void paint(Graphics g) {}
    };
    c.setBackground(Color.black);
    add(c);
    setSize(800, 600);
    show();
  }

  public void mouseClicked(MouseEvent e) {
    Graphics g = c.getGraphics();
    g.setColor(Color.red);

    int x = e.getX();
    int y = e.getY();
    
    g.fillOval(x, y, 5, 5);
  }

  public void mouseExited(MouseEvent e) {}
  public void mouseEntered(MouseEvent e) {}
  public void mouseReleased(MouseEvent e) {}
  public void mousePressed(MouseEvent e) {}
  public void mouseMoved(MouseEvent e) {}
  public void mouseDragged(MouseEvent e) {}
}
