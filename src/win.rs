#![allow(unused)]
use std::{
  num::{NonZero, NonZeroU32},
  rc::Rc,
};

use softbuffer::{Context, Surface};
use winit::{
  application::ApplicationHandler,
  dpi::LogicalSize,
  event::*,
  event_loop::{ActiveEventLoop, EventLoop},
  keyboard::{KeyCode, PhysicalKey},
  window::Window,
};

struct State {
  window: Option<Rc<Window>>,
  context: Option<Context<Rc<Window>>>,
  surface: Option<Surface<Rc<Window>, Rc<Window>>>,
}

const WIDTH: u32 = 400;
const HEIGHT: u32 = 300;

pub struct Win {
  state: State,
}

impl Win {
  pub fn new() -> Self {
    Self {
      state: State {
        window: None,
        context: None,
        surface: None,
      },
    }
  }
  pub fn show(&mut self) {
    let event_loop = EventLoop::new().unwrap();

    let _ = event_loop.run_app(self);
  }
}

impl ApplicationHandler for Win {
  fn resumed(&mut self, event_loop: &winit::event_loop::ActiveEventLoop) {
    if !self.state.window.is_none() {
      return;
    }

    let attr = Window::default_attributes()
      .with_inner_size(LogicalSize::new(WIDTH, HEIGHT))
      .with_resizable(false);
    let window = event_loop.create_window(attr).unwrap();

    let window = Rc::new(window);

    let context = Context::new(window.clone()).expect("Failed to create softbuffer context");
    let surface =
      Surface::new(&context, window.clone()).expect("Failed to create softbuffer surface");

    self.state.window = Some(window);
    self.state.context = Some(context);
    self.state.surface = Some(surface);
  }
  fn window_event(
    &mut self, event_loop: &winit::event_loop::ActiveEventLoop, window_id: winit::window::WindowId,
    event: winit::event::WindowEvent,
  ) {
    match event {
      WindowEvent::CloseRequested => event_loop.exit(),
      WindowEvent::Resized(size) => {
        if let Some(surface) = &mut self.state.surface {
          if let (Some(w), Some(h)) = (NonZeroU32::new(size.width), NonZeroU32::new(size.height)) {
            let _ = surface.resize(w, h);
          }
        }
      }

      WindowEvent::RedrawRequested => {
        if let Some(surface) = &mut self.state.surface {
          let mut buf = surface.buffer_mut().unwrap();
          buf.fill(0);
          buf.present().ok();
        }
      }
      WindowEvent::KeyboardInput {
        event:
          KeyEvent {
            physical_key: PhysicalKey::Code(code),
            state,
            ..
          },
        ..
      } => match (code, state.is_pressed()) {
        (KeyCode::Escape, true) => event_loop.exit(),
        _ => {}
      },
      _ => {}
    }
  }
}
